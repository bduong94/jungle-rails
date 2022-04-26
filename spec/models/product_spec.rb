require 'rails_helper'
require "Product"
require "Category"

RSpec.describe Product, type: :model do
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
      @sample_product.quantity = nil
      expect(@sample_product).to_not be_valid
      expect(@sample_product.errors.full_messages).to include("Quantity can't be blank")
    end

    it "Does not contain a category" do
      @sample_product.category = nil
      expect(@sample_product).to_not be_valid
      expect(@sample_product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
