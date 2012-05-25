class CompanyController < ApplicationController
  before_filter :is_company_unless_admin
  
  def index
    @thistext = "You're a Company! Here are some company specific details: blah blah blah" if company_user_signed_in?
    @thistext = "Woah! You're an Admin. Wow! Here are some highly sensitive details about stuff: hum-de-dum, boop-de-doop" if admin_signed_in?
  end
  
  private
  
  def is_company_unless_admin
    unless admin_signed_in? or company_user_signed_in?
      redirect_to new_company_user_session_path, alert: "You must be logged in to access this Corporate Hospitality area"
    end
  end
end
