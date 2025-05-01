require 'receipt_item'
require 'sale_item'

RSpec.describe ReceiptItem do
  it "rounds correctly by rounding to the nearset 0.05" do
    regular_item = SaleItem.new(name: "Cheap Item", price: 1.01)
    receipt_item = ReceiptItem.new(sale_item: regular_item)

    expect(receipt_item.round_to_nearest_five_hundredths(regular_item.price)).to eq(1.05)
  end

  describe "taxes are set appropriately" do
    it "Adds 10 percent tax to imported items" do
      regular_item = SaleItem.new(name: "Regular Item", price: 1)
      receipt_item = ReceiptItem.new(sale_item: regular_item)

      expect(receipt_item.sales_tax).to eq(0.1)
    end

    it "Does not charge tax for exempt items" do
      exempt_item = SaleItem.new(name: "Song of Ice and Fire", isBook: true, price: 1)
      receipt_item = ReceiptItem.new(sale_item: exempt_item)

      expect(receipt_item.sales_tax).to eq(0)
    end

    it "Adds 5 percent to imported items" do
      exempt_item = SaleItem.new(name: "Imported Wine", imported: true, price: 1)
      receipt_item = ReceiptItem.new(sale_item: exempt_item)

      expect(receipt_item.sales_tax).to eq(0.15)
    end
  end

  it "Adds taxes to total price" do
    exempt_item = SaleItem.new(name: "Imported Wine", imported: true, price: 1)
      receipt_item = ReceiptItem.new(sale_item: exempt_item)

      expect(receipt_item.total_price).to eq(1.15)
  end
end