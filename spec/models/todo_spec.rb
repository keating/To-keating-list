require 'spec_helper'

describe Todo do
  describe "validate todo" do
    it "must have a title" do
      todo = Todo.new
      expect(todo).not_to be_valid
      todo.title = 'sample'
      expect(todo).to be_valid
    end
  end

end