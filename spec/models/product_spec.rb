require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    it 'Should save a valid product' do
      @category = Category.create(name: "Mobile")
      @product = Product.new(
        name: "Huge Iphone",
        price: 3.50,
        quantity: 5,
        category_id: @category.id
      )
      expect(@product).to be_valid
    end

    it 'Should not save without a valid name' do
      @category = Category.create(name: "Mobile")
      @product = Product.new(
        
        price: 3.50,
        quantity: 5,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end

    it 'Should not save without a valid price' do
      @category = Category.create(name: "Mobile")
      @product = Product.new(
        name: "Huge Iphone",
        
        quantity: 5,
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end

    it 'Should not save without a valid quantity' do
      @category = Category.create(name: "Mobile")
      @product = Product.new(
        name: "Huge Iphone",
        price: 3.50,
        
        category_id: @category.id
      )
      expect(@product).to_not be_valid
    end

    it 'Should not save without a valid category id' do
 
      @product = Product.new(
        name: "Huge Iphone",
        price: 3.50,
        quantity: 5,
        
      )
      expect(@product).to_not be_valid
    end
  end

end
