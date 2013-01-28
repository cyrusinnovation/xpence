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
end
