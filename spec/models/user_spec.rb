require 'rails_helper'
require 'User'

RSpec.describe User, type: :model do
  # create_table "users", force: :cascade do |t|
  #   t.string   "first_name"
  #   t.string   "last_name"
  #   t.string   "email"
  #   t.string   "password_digest"
  #   t.datetime "created_at",      null: false
  #   t.datetime "updated_at",      null: false
  # end

  describe 'Validations' do
    before do
      @first_user = User.new({first_name: "Tom", last_name:"Dinkle", email: "test123@test.com", password:"Fast", password_confirmation:"Fast"})
    end

    it 'Creates the new user' do
      expect(@first_user).to be_valid
    end

    it 'does not have a blank first_name' do
      @first_user.first_name = nil
      expect(@first_user).to_not be_valid
      expect(@first_user.errors.full_messages).to include("First name can't be blank")
    end

    it 'does not have a blank last_name' do
      @first_user.last_name = nil
      expect(@first_user).to_not be_valid
      expect(@first_user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'does not have a blank email' do
      @first_user.email = nil
      expect(@first_user).to_not be_valid
      expect(@first_user.errors.full_messages).to include("Email can't be blank")
    end

    it 'does not have a blank password' do
      @first_user.password = nil
      expect(@first_user).to_not be_valid
      expect(@first_user.errors.full_messages).to include("Password can't be blank")
    end

    it 'does not have a blank password confirmation' do
      @first_user.password_confirmation = nil
      expect(@first_user).to_not be_valid
      expect(@first_user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'does not have matching password and password confirmation' do
    end

    it 'does not use a unique email' do
    end
  end

  describe '.authenticate_with_credentials' do
  end
end
