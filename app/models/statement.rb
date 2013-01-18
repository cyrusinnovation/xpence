class Statement < ActiveRecord::Base

  attr_accessible :closingdate, :rawstatement
  has_attached_file :rawstatement

  has_many :expenses

  HEADERS = ["date", "amount", "vendor", "description"]

  def parse_raw_statement
    CSV.read(rawstatement.path).each do |row|
      ExpenseParser.create_from_row(:statement => self, :row => row)
    end
  end

  def complete?
    expenses.where('complete = false').empty?
  end

  def percent_done
    to_percent((self.expenses.where('complete = ?', true).count)/(self.expenses.count).to_f)
  end

  def to_csv
    CSV.generate do |csv|
      csv << ["employee"] + HEADERS
      exp = self.expenses.order('employee_id')
      exp.each do |expense|
        unless expense.employee == nil
          emp = expense.employee.name
          csv << expense.attributes.values_at(*HEADERS).unshift(emp)
        end
      end
    end
  end

  def total_expenses
    expenses.sum('amount')
  end

  def incomplete_expenses
    expenses.where('complete = false')
  end

  def employees_with_incomplete
    incomplete_expenses.map { |exp| exp.employee }.uniq
  end

  private 

  def to_percent(num)
    if num.is_a?(Float)
      (num * 100).to_i
    else 
      0
    end
  end
end
