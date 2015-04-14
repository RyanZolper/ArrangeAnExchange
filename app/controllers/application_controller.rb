class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :null_session
  before_action :current_user

  def authenticate_admin_user!
    if !signed_in?
      redirect_to root_path
    elsif !current_user.admin != true
      redirect_to root_path
    end
  end


  helper_method :current_user, :signed_in?

  def current_user
    @current_user ||= User.where(:id => session[:current_user_id]).first
  end

  def signed_in?
    if current_user.present?
      return true
    end
  end

  private



end
