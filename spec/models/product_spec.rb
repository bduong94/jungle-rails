require 'rails_helper'
require "Product"
require "Category"

# Refrence
# create_table "products", force: :cascade do |t|
#   t.string   "name"
#   t.text     "description"
#   t.string   "image"
#   t.integer  "price_cents"
#   t.integer  "quantity"
#   t.datetime "created_at",  null: false
#   t.datetime "updated_at",  null: false
#   t.integer  "category_id"
# end

describe "Tests for Products" do
  describe "Validations" do
    before do
      @sample_category = Category.new({name:"Furniture"})
      @sample_product = Product.new({name: "Table", price_cents: 30000, quantity: 30, category: @sample_category})
    end

    it "Contains a name, price, quantity and category" do
      expect(@sample_product).to be_valid
    end

    it "Does not contain a name" do
      @sample_product.name = nil
      expect(@sample_product).to_not be_valid
      expect(@sample_product.errors.full_messages).to include("Name can't be blank")
    end

    it "Does not contain a price" do
      @sample_product.price_cents = nil
      expect(@sample_product).to_not be_valid
      expect(@sample_product.errors.full_messages).to include("Price can't be blank")
    end

    it "Does not contain a quantity" do
    end

    it "Does not contain a category" do
    end
  end
end
