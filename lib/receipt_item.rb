class ReceiptItem
  attr_accessor :sale_item, :quantity
  attr_reader :sales_tax, :total_price

  def initialize(sale_item:, quantity: 1)
    @sale_item = sale_item
    @quantity = quantity
    @sales_tax = calculate_tax * quantity
    @total_price = round_to_nearest_five_hundredths((sale_item.price * quantity) + @sales_tax)
  end

  def round_to_nearest_five_hundredths(unrounded_price)
    ((unrounded_price * 20).ceil) / 20.0
  end

  private

  def calculate_tax
    tax_amount = 0.0
    tax_amount += sale_item.price * 0.10 unless sale_item.exempt
    tax_amount += sale_item.price * 0.05 if sale_item.imported
    
    tax_amount.round(3)
  end
end