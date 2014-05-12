require 'spec_helper'

describe 'todos/_signed_in.html.erb' do
  it "there is a new todo link" do
    assign(:todo, stub_model(Todo))
    assign(:todos, [stub_model(Todo)])
    assign(:todo_archived, [stub_model(Todo)])
    render
    expect(rendered).to match /New Todo/
  end
end