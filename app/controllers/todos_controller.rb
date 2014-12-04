class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]
  respond_to :json

  # GET /todos.json
  def index
    respond_with Todo.all
  end

  # GET /todos/1.json
  def show
    respond_with @todo
  end

  # POST /todos.json
  def create
    respond_with Todo.new(todo_params)
  end

  # PATCH /todos/1.json
  def update
    respond_with @todo.update(todo_params)
  end

  # DELETE /todos/1.json
  def destroy
    respond_with @todo.destroy
  end

  private
    def set_todo
      @todo = Todo.find(params[:id])
    end

    def todo_params
      params.require(:todo).permit(:title, :is_completed, :completed_at)
    end
end
