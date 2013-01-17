class Employee < ActiveRecord::Base
  attr_accessible :cardnumber, :name, :admin, :email

  has_many :expenses

  def self.update_from_omniauth(options={})
    emp = Employee.find_by_email(options[:email])
    return nil unless emp
    emp.tap do |employee|
      employee.provider = options[:provider]
      employee.uid = options[:uid]
      employee.save
    end
  end

  def statement_status(statement)
    exp = expenses.where('statement_id = ?', statement.id)
    if exp.detect{|ex| ex.complete == false}
      "incomplete"
    else
      "complete"
    end
  end

  private

  def capitalize_name
    name.titleize
  end


end
