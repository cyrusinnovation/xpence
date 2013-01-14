# Rails.application.config.middleware.use OmniAuth::Builder do 
#   provider :google_oauth2, '54802864448.apps.googleusercontent.com', 'a85Csy5LxYiNhq-XRIsYC1SH' 
# end

Rails.application.config.middleware.use OmniAuth::Builder do 
  provider :google_apps, :domain => 'cyrusinnovation.com' 
end