class SessionsController < ApplicationController
  def new
  end

  def create
    dispatcher = Dispatcher.find_by(username: params[:username])
    if dispatcher && dispatcher.authenticate(params[:password])
      session[:dispatcher_id] = dispatcher.id
      redirect_to main_path
    else
      flash.now[:alert] = "Log in failed..."
      render :new
    end
  end

  def destroy
    session[:dispatcher_id] = nil
    redirect_to new_session_path
  end
end
