class ApplicationController < ActionController::Base
  include Pundit

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Generate a cache key for all elements of a given
  # Class.
  #
  def cache_key_for_all(value)
    count          = value.to_s.classify.constantize.count
    max_updated_at = value.to_s.classify.constantize.maximum(:updated_at).try(:utc).try(:to_s, :number)
    "#{value.to_s.tableize}/all-#{count}-#{max_updated_at}"
  end
  helper_method :cache_key_for_all

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
