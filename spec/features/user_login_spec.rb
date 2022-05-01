require 'rails_helper'

RSpec.feature "User Login", type: :feature, js: true do
  #SET UP
  @user = User.create!(first_name: "Brian", last_name: "Duong", email:"test123@123.com", password: "test123", password_confirmation: "test123")

  
end
