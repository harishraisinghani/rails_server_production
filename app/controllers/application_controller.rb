class ApplicationController < ActionController::Base
  protect_from_forgery unless: -> { request.format.json? } #This is key otherwise CORS errors

  before_action :opening_access_control_header

  #This method ensures no Access Control Allow Origin errors
  def opening_access_control_header
    headers['Access-Control-Allow-Origin'] = '*'
  end

  protected

  #Create a session with a dispatcher_id that is the dispatcher's id
  def current_dispatcher
    @current_dispatcher ||= Dispatcher.find(session[:dispatcher_id]) if session[:dispatcher_id]
  end

  helper_method :current_dispatcher
end
