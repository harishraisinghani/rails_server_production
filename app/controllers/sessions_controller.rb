class SessionsController < ApplicationController
  def new
    if current_dispatcher
      redirect_to main_path
    end
  end

  def create
    @dispatcher = Dispatcher.find_by(username: params[:username])
    if @dispatcher && @dispatcher.authenticate(params[:password])
      session[:dispatcher_id] = @dispatcher.id
      redirect_to main_path
    else
      flash.now[:alert] = "Log in failed..."
      redirect_to new_session_path
    end
  end

  def destroy
    session[:dispatcher_id] = nil
    redirect_to new_session_path
  end
end

