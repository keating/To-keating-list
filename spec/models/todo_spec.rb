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

  describe "status of todo" do

    let(:todo) { FactoryGirl.create(:todo) }

    it "the default status is active" do
      expect(todo.status).to eq("active")
    end

    it "status is archived after done" do
      todo.done
      expect(todo.status).to eq("archived")
    end
  end

end