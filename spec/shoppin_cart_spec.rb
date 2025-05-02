require 'shopping_cart'
require 'receipt_item'
require 'sale_item'

RSpec.describe ShoppingCart do
  let(:basil) {SaleItem.new(name: "Michigan Basil", price: 7.99)}
  let(:basil_receipt){ReceiptItem.new(sale_item: basil, quantity: 1)}


  let(:chocolates) {SaleItem.new(name: "Chocolate", imported: true, isFood: true, price: 11.25)}
  let(:chocolate_receipt) {ReceiptItem.new(sale_item: chocolates, quantity: 1)}

  let(:shopping_cart) {ShoppingCart.new}

  describe '#initialize' do
    it 'initializes with an empty receipt_items array' do
      expect(shopping_cart.receipt_items).to eq([])
    end
  end

  describe '#add_item' do
    it 'adds a receipt item to the shopping cart' do
      shopping_cart.add_item(basil_receipt)
      expect(shopping_cart.receipt_items).to include(basil_receipt)
    end
  end

  describe '#total_sales_tax' do
    it 'calculates the total sales tax of the items in the cart' do
      shopping_cart.add_item(basil_receipt)
      shopping_cart.add_item(chocolate_receipt)
      expect(shopping_cart.total_sales_tax).to eq(1.40)
    end
  end

  describe '#total_purchase' do
    it 'calculates the total purchase price of the items in the cart' do
      shopping_cart.add_item(basil_receipt)
      shopping_cart.add_item(chocolate_receipt)
      expect(shopping_cart.total_purchase).to eq(20.64)
    end
  end
end