ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587, 
  :domain               => 'cyrusinnovation.com',
  :user_name            => 'amex@cyrusinnovation.com',
  :password             => 'burntt0ast',
  :authentication       => 'plain',
  :enable_starttls_auto => true
}