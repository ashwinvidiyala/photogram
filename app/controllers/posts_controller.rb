class PostsController < ApplicationController
  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.eager_load(:user)
  end

  def create
   post = Post.create(post_params)

   return redirect_to user_path current_user if post.valid?

   flash[:errors] = post.errors.full_messages
   redirect_back(fallback_location: "/users/#{current_user.id}")
   # redirect_back(fallback_location: user_path(current_user))
 end

 def destroy
   Post.find(params[:id]).destroy
   redirect_to user_path current_user
 end

 private

 def post_params
   params.require(:post).permit(:image, :content).merge(user: current_user)
 end
end
