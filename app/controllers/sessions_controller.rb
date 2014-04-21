class SessionsController < ApplicationController
  def new
    session[:redirect_after_login] = request.referrer
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:redirect_after_login], :notice => "Logged in"
    else
      flash.now[:alert] = "Invalid e-mail or password"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to restaurants_path
  end
end
