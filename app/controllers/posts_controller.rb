class PostsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      flash[:success] = "post created"
      redirect_to @post.board
    else
      render 'boards/show', status: :unprocessable_entity
    end
  end

  private
  def post_params
    params.require(:post).permit(:content, :board_id)
  end
end
