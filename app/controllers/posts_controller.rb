class PostsController < ApplicationController
  def create
   post = Post.create(post_params)
   if post.valid?
     return redirect_to user_path current_user
   end

   flash[:errors] = post.errors.full_messages
   redirect_back(fallback_location: "/users/#{current_user.id}")
   # redirect_back(fallback_location: user_path(current_user))
 end

 private

 def post_params
   params.require(:post).permit(:image, :description).merge(user: current_user)
 end
end
