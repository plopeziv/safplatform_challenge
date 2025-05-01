require 'receipt_item'
require 'sale_item'
require 'bigdecimal'

def D(value)
  BigDecimal(value.to_s)
end

RSpec.describe ReceiptItem do
  it "calculates total price based on quantity" do
    regular_item = SaleItem.new(name: "Cheap Item", price: 1)
    receipt_item = ReceiptItem.new(sale_item: regular_item, quantity: 2)

    expect(receipt_item.total_price).to eq(D("2.20"))
  end

  it "rounds correctly by rounding to the nearest 0.05" do
    regular_item = SaleItem.new(name: "Cheap Item", price: 1.01)
    receipt_item = ReceiptItem.new(sale_item: regular_item)

    expect(receipt_item.send(:round_to_nearest_five_hundredths, D("1.01"))).to eq(D("1.05"))
  end

  describe "taxes are set appropriately" do
    it "Adds 10 percent tax to regular items" do
      regular_item = SaleItem.new(name: "Regular Item", price: 1)
      receipt_item = ReceiptItem.new(sale_item: regular_item)

      expect(receipt_item.sales_tax).to eq(D("0.10"))
    end

    describe "Exempt items do not charge taxes" do
      it "Does not charge tax for Food" do
        exempt_item = SaleItem.new(name: "Chocolate", isFood: true, price: 1)
        receipt_item = ReceiptItem.new(sale_item: exempt_item)

        expect(receipt_item.sales_tax).to eq(D("0.00"))
      end

      it "Does not charge tax for Books" do
        exempt_item = SaleItem.new(name: "Song of Ice and Fire", isBook: true, price: 1)
        receipt_item = ReceiptItem.new(sale_item: exempt_item)

        expect(receipt_item.sales_tax).to eq(D("0.00"))
      end

      it "Does not charge tax for Medical items" do
        exempt_item = SaleItem.new(name: "Packet of Pills", isMedical: true, price: 1)
        receipt_item = ReceiptItem.new(sale_item: exempt_item)

        expect(receipt_item.sales_tax).to eq(D("0.00"))
      end
    end

    it "Adds 5 percent to imported items" do
      imported_item = SaleItem.new(name: "Imported Wine", imported: true, price: 1)
      receipt_item = ReceiptItem.new(sale_item: imported_item)

      expect(receipt_item.sales_tax).to eq(D("0.15"))
    end

    it "Rounds taxes for each individual item before multiplying" do
      multiple_items = SaleItem.new(name: "Chocolate", imported: true, isFood: true, price: 11.25)
      receipt_item = ReceiptItem.new(sale_item: multiple_items, quantity: 3)

      expect(receipt_item.sales_tax).to eq(D("1.80"))
    end
  end

  it "Adds taxes to total price" do
    imported_item = SaleItem.new(name: "Imported Wine", imported: true, price: 1)
    receipt_item = ReceiptItem.new(sale_item: imported_item, quantity: 2)

    expect(receipt_item.total_price).to eq(D("2.30"))
  end
end