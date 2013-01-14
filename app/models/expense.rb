class Expense < ActiveRecord::Base
  attr_accessible :amount, :date, :vendor, :employee, :statement, :receipt_sent, :description, :client, :splits

  belongs_to :employee
  belongs_to :statement


  validates :client, :inclusion => { :in => CLIENTS }, :if => :client_expense?

  def client_expense?
    description.downcase.include?("client") unless description == nil
  end

  def has_all_info?
    true if receipt_sent == true && description != nil
  end
  
end
