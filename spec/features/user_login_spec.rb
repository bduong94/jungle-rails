require 'rails_helper'

RSpec.feature "User Login", type: :feature, js: true do
  #SET UP
  before do
    @user = User.create!(
      first_name: "Brian", 
      last_name:"Duong", 
      email: "test123@123.com", 
      password:"test123", 
      password_confirmation:"test123")
  end

  scenario "User visits home page, clicks login, fills out information and redirects to homepage logged in" do
    #ACT
    visit root_path
    click_link('Login')

    sleep 1

    fill_in 'email', with: 'test123@123.com'
    fill_in 'password', with: 'test123'
    click_button 'Submit'

    sleep 1

    #DEBUG
    save_screenshot

    #VERIFY
    expect(find('nav')).to have_content("Signed in as Brian")
  end
end
