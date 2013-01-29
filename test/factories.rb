require 'factory_girl'

FactoryGirl.define do 
  factory :employee do 
    provider "google_apps"
    uid "12345"
    name "Matthew Salerno"
    admin false

   factory :admin do 
     admin true
   end
  end

  factory :employee2, class: Employee do 
    name "Aldric Giacomoni"
    admin false
  end

  factory :statement do 
    closingdate Date.today
  end

  factory :expense do 
    statement
    employee
    date Date.today
    amount 10.56
    vendor 'Sears'
  end
  
  factory :expense2, class: Expense do 
    statement
    association :employee, factory: :employee2, strategy: :create
    date Date.today
    amount 20.56
    vendor 'Sears'
  end
end
