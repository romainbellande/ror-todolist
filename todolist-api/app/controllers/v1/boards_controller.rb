class V1::BoardsController < ApplicationController
  before_action :find_board, only: [:update, :show, :destroy]

  BoardReducer = Rack::Reducer.new(
    Board.all,
    ->(title:) { where('lower(title) like ?', "%#{title.downcase}%") },
    ->(description:) { where('lower(description) like ?', "%#{description.downcase}%") },
  )

  def index
    @boards = Board.paginate(page: params[:page])
    render json: @boards, include: params[:include], meta: pagination_dict(@boards)
  end

  def show
    render json: @board, include: params[:include]
  end

  def create
    @board = Board.new(board_params)

    if @board.save
      render json: @board
    else
      render json: { status: 400, errors: @board.errors }, status: 400
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
    ActionController::Parameters.permit_all_parameters = true
    # return ActionController::Parameters.new
    return params.require(:board).permit(:title, :description, :board)
  end

  def pagination_dict(collection)
    {
      current_page: collection.current_page,
      per_page: collection.per_page, # use collection.previous_page when using will_paginate
      total_pages: collection.total_pages,
      total_count: collection.total_entries
    }
  end
end
