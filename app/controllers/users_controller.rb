class UsersController < ApplicationController
  skip_before_action :require_login, only: [:register, :create]

  def register; end

  def index
    @posts = Post.eager_load(:user, :comments, :comments => :user)
    # @posts = Post.all
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.eager_load(:comments, :comments => :user)
  end

  def create
    user = User.create(user_params)
    if user.valid?
      session[:user_id] = user.id
      return redirect_to users_path
    end
    flash[:errors] = user.errors.full_messages
    redirect_back fallback_location: register_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
