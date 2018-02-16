class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    todo = Todo.new(todo_params)
    if todo.save
      redirect_to root_path, notice: 'Tarea Guardada!!!'
    else
      redirect_to todos_new_path, notice: 'La tarea no se pudo almacenar =('
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      redirect_to @todo, notice: 'La tarea fue actualizada!!!'
    else
      redirect_to edit_todo_path(@todo), notice: 'No se pudo actializar!!!'
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to root_path, notice: 'Tarea Eliminada Correctamente'
  end

  def complete
    @todo = Todo.find(params[:id])
    @todo.update(completed: true)
    redirect_to root_path
  end

  def list
    @todos = Todo.all
  end

  private

  def todo_params
    params.require(:todo).permit(:description, :completed)
  end
end
