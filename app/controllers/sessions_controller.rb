class SessionsController < ApplicationController
  def login; end

  def create
    user = User.find_by_email(params[:email])
    if user
      if user.authenticate(params[:password])
        session[:user_id] = user.id
        return redirect_to users_path
      end
        flash[:errors] = ['Incorrect password']
    else
      flash[:errors] = ['Incorrect email']
    end
    redirect_back fallback_location: login_path
  end

  def destroy
    session.delete(:user_id) if session[:user_id]
    redirect_to login_path
  end
end
