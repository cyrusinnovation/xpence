class ExpenseParser
  attr_accessor :row, :statement, :target_instance

  def initialize(row, statement)
    @row = row
    @statement = statement
    @target_instance = Expense.new
  end

  def self.create_from_row(options={})
    rawexpense = self.new(options[:row], options[:statement])
    rawexpense.parse
  end

  def parse
    target_instance.amount = amount_from_row
    target_instance.date = date_from_row
    target_instance.vendor = vendor_from_row
    target_instance.employee = employee_from_row
    target_instance.statement = statement
    target_instance.save unless payment_row 
  end

  private 

  def payment_row
    row[2].include?('ONLINE PAYMENT - THANK YOU')
  end

  def amount_from_row
    row[7]
  end

  def date_from_row
    date_as_string = row[0]
    Date.strptime(date_as_string, '%m/%d/%Y')
  end

  def vendor_from_row
    row[10]
  end

  def employee_from_row
    emp_name = row[3]
    Employee.find_by_name(sanitize_name_from_amex(emp_name))
  end

  def sanitize_name_from_amex(name)
    name.split(/\s+/).join(" ").downcase
  end

end