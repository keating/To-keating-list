json.array!(@todos) do |todo|
  json.extract! todo, :id, :title, :remark
  json.url todo_url(todo, format: :json)
end
