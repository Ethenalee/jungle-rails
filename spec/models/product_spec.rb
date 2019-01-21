require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

      it 'has a name' do
        record = Product.new
        record.name = '' # invalid state
        record.valid?
        expect(record.errors[:name]).to include "can't be blank"

        record.name = 'foo'
        record.valid?
        expect(record.errors[:name]).not_to include "can't be blank"
      end

      it 'has a price' do
        record = Product.new
        record.price = '' # invalid state
        record.valid?
        expect(record.errors[:price]).to include "is not a number"

        record = Product.new
        record.price = 'abcd' # invalid state
        record.valid?
        expect(record.errors[:price]).to include "is not a number"

        record.price = '1234'
        record.valid?
        expect(record.errors[:price]).not_to include "is not a number"
      end

      it 'has a quantity' do
        record = Product.new
        record.quantity = '' # invalid state
        record.valid?
        expect(record.errors[:quantity]).to include "is not a number"

        record = Product.new
        record.quantity = 'abcd' # invalid state
        record.valid?
        expect(record.errors[:quantity]).to include "is not a number"

        record.quantity = '1234'
        record.valid?
        expect(record.errors[:quantity]).not_to include "is not a number"
      end

      it "Should belong to category" do
        record = Product.new
        category = Category.new
        category.products << record
        expect(record.category).to be category

        record = Product.new
        record.valid?
        expect(record.errors[:category]).to include "can't be blank"
      end  

      it "Should save" do
        record = Product.new
        record.name = "random"
        record.price = '123'
        record.quantity = '234'
        category = Category.new
        category.products << record
        saved = record.save
        expect(saved).to eql(true)
      end

  end
end
