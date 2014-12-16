class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized
  
  private
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def user_not_authorized
    flash[:error] = "You are not authorized to perform this action."
    redirect_to request.headers["Referer"] || root_path
  end

end
