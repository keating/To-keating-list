require 'spec_helper'

describe TodosController do

  context "without render_views" do
    before(:each) do
      @user = FactoryGirl.create(:user)
      sign_in @user
    end

    describe "GET 'index'" do
      it "return http success" do
        get 'index'
        response.should be_success
      end
    end

    describe "POST create" do
      subject do
        lambda { post :create, {todo: { title: 'sample title' } } }
      end

      it { should change { @user.todos.count }.by(1) }
      it { should change { Todo.count }.by(1) }
    end

    context "my todo" do
      before { FactoryGirl.create(:todo, user: @user) }
      let(:todo) { Todo.first }

      describe "finish" do
        subject { lambda { post :finish, { id: todo.id } } }

        it { should change { @user.todos.archived.count }.by(1) }
        it { should change { Todo.archived.count }.by(1) }
      end

      describe "remove" do
        subject { lambda { delete :destroy, { id: todo.id } } }

        it { should change { @user.todos.active.count }.by(-1) }
        it { should change(Todo, :count).by(-1) }
      end
    end

    context "other's todo" do
      before { FactoryGirl.create(:user_with_todos).todos }
      let(:other_todo) { Todo.first }

      describe "finish" do
        subject { lambda { post :finish, {id: other_todo.id} } }
        it { should raise_error ActiveRecord::RecordNotFound }
      end

      describe "remove" do
        subject { lambda { delete :destroy, {id: other_todo.id} } }
        it { should raise_error ActiveRecord::RecordNotFound }
      end
    end
  end

  # tests like this, using controller test is better or using feature tests is better?
  context "with render_views" do
    render_views

    describe "GET 'index'" do
      it "can not visit without signed in" do
        get 'index'
        expect(response.body).not_to match /New Todo/
      end

      it "not include todos" do
        sign_in FactoryGirl.create(:user)
        get 'index'
        expect(response.body).to match /New Todo/
        expect(response.body).not_to match /sample active todo/
        expect(response.body).not_to match /sample archived todo/
      end

      it "include todos" do
        sign_in FactoryGirl.create(:user_with_todos)
        get 'index'
        expect(response.body).to match /New Todo/
        expect(response.body).to match /sample active todo/
        expect(response.body).to match /sample archived todo/
      end
    end
  end

end