class Api::V1::BoardsController < ApplicationController
  before_action :find_board, only: [:update, :show, :destroy]

  def index
    @boards = Board.all
    render json: @boards
  end

  def show
    render json: @board
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      render json: @board
    else
      render errors: { error: 'Unable to create board.' }, status: 400
    end
  end

  def update
    if @board
      @board.update(board_params)
      render json: { message: 'Board successfully updated.' }, status: 200
    else
      render errors: { error: 'Unable to update board.' }, status: 400
    end
  end

  def destroy
    if @board
      @board.destroy
      render json: { message: 'Fact successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to delete board.' }
    end
  end


  private

  def find_board
    @board = Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:board, :title)
  end

end
