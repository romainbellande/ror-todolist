class V1::TodosController < ApplicationController
  before_action :find_todo, only: [:update, :show, :destroy]

  TodoReducer = Rack::Reducer.new(
    Todo.all,
    ->(title:) { where('lower(title) like ?', "%#{title.downcase}%") },
    ->(description:) { where('lower(description) like ?', "%#{description.downcase}%") },
  )

  def index
    @todos = TodoReducer.apply(params)
    render json: @todos, include: params[:include]
  end

  def show
    render json: @todo, include: params[:include]
  end

  def create
    @todo = Todo.new(todo_params)

    if @todo.save!
      render json: @todo
    else
      render errors: { error: 'Unable to create todo.' }, status: 400
    end
  end

  def update
    if @todo
      @todo.update(todo_params)
      render json: { message: 'Todo successfully updated.' }, status: 200
    else
      render errors: { error: 'Unable to update todo.' }, status: 400
    end
  end

  def destroy
    if @todo
      @todo.destroy
      render json: { message: 'Todo successfully updated.' }, status: 200
    else
      render json: { error: 'Unable to delete todo.' }
    end
  end


  private

  def find_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params
    params.require(:todo).permit(:todo, :title, :description, :board_id)
  end

end
