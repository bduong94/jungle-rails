class Admin::DashboardController < ApplicationController
  http_basic_authenticate_with name: "test", password: "test123"
  
  def show
  end
end
