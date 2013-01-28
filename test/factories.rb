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
end
