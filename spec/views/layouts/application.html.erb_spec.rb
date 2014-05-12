require 'spec_helper'

describe 'layouts/application.html.erb' do
  before do
    view.stub(:user_signed_in?).and_return(false)
  end

  it "there is a sign in link" do
    render
    expect(rendered).to match /Sign in/
  end
end