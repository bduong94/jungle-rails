require 'rails_helper'
require "Product"

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

    it "Contains a name, price, quantity and category" do
      sample_product = Product.new({name: "Table", price_cents: 30000, quantity: 30, category_id: 2})
      expect(sample_product.name).to_not be_nil
      expect(sample_product.price_cents).to_not be_nil
      expect(sample_product.quantity).to_not be_nil
      expect(sample_product.category_id).to_not be_nil
    end

    it "Does not contain a name" do
      sample_product = Product.new({name: nil, price_cents: 30000, quantity: 30, category_id: 2})
      expect(sample_product.name).to be_nil
      expect(sample_product.price_cents).to_not be_nil
      expect(sample_product.quantity).to_not be_nil
      expect(sample_product.category_id).to_not be_nil
    end

    it "Does not contain a price" do
    end

    it "Does not contain a quantity" do
    end

    it "Does not contain a category" do
    end
  end
end
