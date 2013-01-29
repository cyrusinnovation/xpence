class Expense < ActiveRecord::Base
  attr_accessible :amount, :date, :vendor, :employee, :statement, :receipt_sent, :description, :client, :splits

  belongs_to :employee
  belongs_to :statement

  NON_RESETABLE_ATTRS = ["id","created_at","updated_at","employee_id","statement_id","date","amount","vendor"]

  validates :client, :inclusion => { :in => CLIENTS }, :if => :client_expense?

  def client_expense?
    description.downcase.include?("client") unless description == nil
  end

  def has_all_info?
    true if receipt_sent == true && description != nil
  end

  def reset
    resetable = (self.attributes.keys) - NON_RESETABLE_ATTRS 
    resetable.each do |attr|
      self.send("#{attr}=", nil)
    end
    self.save
  end

  def check_and_set_complete
    self.complete = true
    self.save
  end
  
end
