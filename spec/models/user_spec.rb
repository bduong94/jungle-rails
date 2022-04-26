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
  end

  describe '.authenticate_with_credentials' do
  end
end
