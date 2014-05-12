class WelcomeController < ApplicationController

  before_action :home_for_signed

  private
    def home_for_signed
      redirect_to home_path if user_signed_in?
    end

end