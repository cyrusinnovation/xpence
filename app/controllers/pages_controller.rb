class PagesController < ApplicationController
  skip_before_filter :require_login

  def welcome 
    render 'welcome'
  end

end
