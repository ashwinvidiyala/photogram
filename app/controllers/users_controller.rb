class UsersController < ApplicationController
  def register; end

  def index
    @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def create
    user = User.create(user_params)

    return redirect_to users_path if user.valid?

    flash[:errors] = user.errors.full_messages
    redirect_back fallback_location: register_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
