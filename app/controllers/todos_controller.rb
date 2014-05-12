class TodosController < ApplicationController
  before_action :authenticate_user!

  def index
    @todo = Todo.new
    @todos = current_user.todos.active.order('updated_at desc')
    @todo_archived = current_user.todos.archived.order('updated_at desc').limit(3)
  end

  def create
    @todo = current_user.todos.build(todo_params)

    respond_to do |format|
      if @todo.save
        format.html { redirect_to todos_path, notice: 'Todo was successfully created.' }
      else
        format.html { render :new } # todo bug here
      end
    end
  end

  def finish
    current_user.todos.find(params[:id]).done
    render :nothing => true
  end

  def destroy
    current_user.todos.active.find(params[:id]).destroy
    render :nothing => true
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def todo_params
      params.require(:todo).permit(:title, :remark)
    end

end
