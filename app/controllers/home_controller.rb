class HomeController < ApplicationController
  skip_before_action :authenticate
  
  def index
    redirect_to dashboard_path if Current.session
  end
end
