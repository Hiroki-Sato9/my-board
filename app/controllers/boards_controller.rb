class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destory]
  before_action :start_user, only: [:edit]

  def index
    @activated_boards = Board.where(activated: true)
    @unactivated_boards = Board.where(activated: false)
  end

  def new
    @board = Board.new
  end

  def create
    @board = Board.new(title: board_params[:title], user_id: current_user.id)
    if @board.save
      flash[:notice] = "board created"
      redirect_to board_path(@board.id)
    else
      flash.now[:alert] = "empty board name"
      render 'new', status: :unprocessable_entity
    end
  end

  def show
    @board = Board.find(params[:id])
    @posts = @board.posts

    @post = @board.posts.build
  end

  def edit
    @board = Board.find(params[:id])
    @posts = @board.posts
  end

  def destroy
    @board = Board.find(params[:id])
    @board.close_board

    redirect_to edit_board_path(@board)
  end

  private
  def board_params
    params.require(:board).permit(:title)
  end

  def start_user
    @board = Board.find(params[:id])
    if @board.user_id != current_user.id
      flash[:alert] = "You cannot edit this board."
      redirect_to @board, status: :see_other
    end
  end
end
