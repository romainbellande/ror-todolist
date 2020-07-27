class V1::BoardsController < ApplicationController
  before_action :find_board, only: [:update, :show, :destroy]

  BoardReducer = Rack::Reducer.new(
    Board.all,
    ->(title:) { where('lower(title) like ?', "%#{title.downcase}%") },
    ->(description:) { where('lower(description) like ?', "%#{description.downcase}%") },
  )

  def index
    @boards = Board.paginate(page: params[:page])
    render json: @boards, include: params[:include]
  end

  def show
    render json: @board, include: params[:include]
  end

  def create
    @board = Board.new(board_params)

    if @board.save!
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
    params.require(:board).permit(:board, :title, :description)
  end

  # def pagination_dict(collection)
  #   {
  #     current_page: collection.current_page,
  #     next_page: collection.next_page,
  #     prev_page: collection.prev_page, # use collection.previous_page when using will_paginate
  #     total_pages: collection.total_pages,
  #     total_count: collection.total_count
  #   }
  # end
end
