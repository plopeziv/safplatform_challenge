require 'sale_item'

RSpec.describe SaleItem do
  it "initializes with name & price" do
    item = SaleItem.new(name: "Michigan Basil", price: 7.99)

    expect(item.name).to eq("Michigan Basil")
    expect(item.price).to eq(7.99)
    expect(item.isFood).to eq(false)
    expect(item.isBook).to eq(false)
    expect(item.isMedical).to eq(false)
    expect(item.imported).to eq(false)
    expect(item.exempt).to eq(false)
  end

  describe "exempt items" do
    it "is exempt if it is a book" do 
      book_item = SaleItem.new(name: "Song of Ice and Fire", isBook: true, price: 29.99)
      expect(book_item.exempt).to eq(true)
    end

    it "is exempt if it is food" do 
      book_item = SaleItem.new(name: "Song of Ice and Fire", isFood: true, price: 29.99)
      expect(book_item.exempt).to eq(true)
    end

    it "is exempt if it is for medical purposes" do 
      book_item = SaleItem.new(name: "Song of Ice and Fire", isMedical: true, price: 29.99)
      expect(book_item.exempt).to eq(true)
    end
  end
end