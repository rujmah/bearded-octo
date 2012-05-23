class CompanyController < ApplicationController
  before_filter :is_company_or_admin?
  def index
  end
  
  private
  
  def is_company_or_admin?
    unless admin_logged_in? or company_user_logged_in?
      flash[:error] = "You must be logged in to access this Corporate Hospitality area"
      redirect_to new_company_user_session_path
    end
      
  end
end
