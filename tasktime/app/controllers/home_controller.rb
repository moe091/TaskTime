class HomeController < ApplicationController
  def home
  	@cur_user = current_user
  end
end
