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

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to request.referer || root_url
  end

  def comment
    @post = Post.find(params[:id])
    @comment = params[:posts][:comment]
    @post.update(comment: @comment)

    redirect_to request.referer || root_url
  end

  private
  def post_params
    params.require(:post).permit(:content, :board_id)
  end
end
