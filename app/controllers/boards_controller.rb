class BoardsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destory]
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

  end

  private
  def board_params
    params.require(:board).permit(:title)
  end
end
