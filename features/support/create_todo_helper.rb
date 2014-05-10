module CreateTodoHelper
  def create_todo(title)
    fill_in 'todo_title', :with => title
    click_button "Create Todo"
  end
end

World(CreateTodoHelper)