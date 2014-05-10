require 'spec_helper'

describe TodosController do

  let(:valid_attributes) { { title: 'sample title' } }

  describe "GET 'index'" do
    it "return http success" do
      get 'index'
      response.should be_success
    end
  end

  describe "POST create" do
    it "creates a new Todo" do
      expect {
        post :create, {:todo => valid_attributes}
      }.to change(Todo, :count).by(1)
    end
  end

end