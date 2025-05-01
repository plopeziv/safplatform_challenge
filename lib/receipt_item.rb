class ReceiptItem
  attr_reader :sale_item, :sales_tax, :total_price

  def initialize(sale_item:)
    @sale_item = sale_item
    @sales_tax = calculate_tax
    @total_price = sale_item.price + @sales_tax
  end

  def round_to_nearest_five_hundredths(unrounded_price)
    ((unrounded_price * 20).ceil) / 20.0
  end

  private

  def calculate_tax
    tax_amount = 0.0
    tax_amount += sale_item.price * 0.10 unless sale_item.exempt
    tax_amount += sale_item.price * 0.05 if sale_item.imported
    
    tax_amount = tax_amount.round(3)

    round_to_nearest_five_hundredths(tax_amount)
  end
end