class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #6.14,6.20
  helper_method :current_user, :logged_in?

  #6.60
  rescue_from Exception, with: :error500
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404

  private
  #6.20
  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def logged_in?
    !!session[:user_id]
  end
  #6.20
  def  authenticate
    return if logged_in?
    redirect_to root_path, alert: 'ログインしてください'
  end

  #6.60
  def error404(e)
    render 'error404', status: 404, formats: [:html]
  end
  
  def error500(e)
    logger.error [e, *e.backtrace].join("\n")
    render 'error500', status: 500, formats: [:html]
  end
end
