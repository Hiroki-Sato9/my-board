class BoardsController < ApplicationController
  before_action :authenticate_user!
  def new
    @board = Board.new
  end

  def create
    @board = Board.new(title: board_params[:title], user_id: current_user.id)
    if @board.save
      redirect_to boards_path(@board.id)
    else
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
