class UsersController < ApplicationController
  def register; end

  def show
    @posts = User.find(params[:id]).posts
  end

  def create
    user = User.create(user_params)

    return redirect_to users_path if user.valid?

    flash[:errors] = user.errors.full_messages
    redirect_to register_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
