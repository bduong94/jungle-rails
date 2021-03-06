require 'rails_helper'
require 'User'

RSpec.describe User, type: :model do
  describe 'Validations' do
    before do
      @first_user = User.new({first_name: "Tom", last_name:"Dinkle", email: "test123@test.com", password:"Partner", password_confirmation:"Partner"})
      @second_user = User.new({first_name: "Dingle", last_name:"Berg", email: "teSt123@test.com", password:"Flesh", password_confirmation:"Flesh"})
    end

    it 'Creates the new user' do
      @first_user.save
      expect(@first_user).to be_valid
    end

    it 'does not have a blank first_name' do
      @first_user.first_name = nil
      @first_user.save
      expect(@first_user.errors.full_messages).to include("First name can't be blank")
    end

    it 'does not have a blank last_name' do
      @first_user.last_name = nil
      @first_user.save
      expect(@first_user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'does not have a blank email' do
      @first_user.email = nil
      @first_user.save
      expect(@first_user.errors.full_messages).to include("Email can't be blank")
    end

    it 'does not have a blank password' do
      @first_user.password = nil
      @first_user.save
      expect(@first_user.errors.full_messages).to include("Password can't be blank")
    end

    it 'does not have a blank password confirmation' do
      @first_user.password_confirmation = nil
      @first_user.save
      expect(@first_user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'does not have matching password and password confirmation' do
      @first_user.password_confirmation = "Fresh"
      @first_user.save
      expect(@first_user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'does not use a unique email (case sensitivity does not matter)' do
      @first_user.save
      @second_user.save
      expect(@second_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'does not have a minimum password length' do
      @first_user.password = "two"
      @first_user.password_confirmation = "two"
      @first_user.save
      expect(@first_user.errors.full_messages).to include("Password is too short (minimum is 5 characters)")
    end
  end

  describe '.authenticate_with_credentials' do
    before do
      @first_user = User.new({first_name: "Tom", last_name:"Dinkle", email: "test123@test.com", password:"Partner", password_confirmation:"Partner"})
      @first_user.save
    end

    it "should authenticate the email and password successfully" do
      email = "test123@test.com"
      password = "Partner"
      user = User.authenticate_with_credentials(email, password)
      expect(user).to eq(@first_user)
    end

    it "should authenticate the email and password successfully with spaces" do
      email = "  test123@test.com  "
      password = "Partner"
      user = User.authenticate_with_credentials(email, password)
      expect(user).to eq(@first_user)
    end

    it "should authenticate the email and password successfully with capitlized characters" do
      email = "TeSt123@test.com"
      password = "Partner"
      user = User.authenticate_with_credentials(email, password)
      expect(user).to eq(@first_user)
    end

    it "should not authenticate the email and password successfully" do
      email = "test123@test.com"
      password = "past123"
      user = User.authenticate_with_credentials(email, password)
      expect(user).to be_nil
    end

  end
end
