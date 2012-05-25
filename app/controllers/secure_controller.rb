class SecureController < ApplicationController
  before_filter :is_admin_unless_company
  
  def index
  end
  
  private
  
  def is_admin_unless_company
    if company_user_signed_in?
      redirect_to root_path, alert: "You must be an Admin to access this highly secure area!"
    else 
      authenticate_admin!
    end
  end
end
