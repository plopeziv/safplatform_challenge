require 'bigdecimal'
require 'bigdecimal/util'

class ReceiptItem
  attr_accessor :sale_item, :quantity
  attr_reader :sales_tax, :total_price

  def initialize(sale_item:, quantity: 1)
    @sale_item = sale_item
    @quantity = quantity
    @sales_tax = calculate_tax * quantity
    @total_price = (sale_item.price.to_d * quantity) + @sales_tax
  end

  private

  def calculate_tax
    tax = BigDecimal("0.0")
    price = sale_item.price.to_d

    tax += price * BigDecimal("0.10") unless sale_item.exempt
    tax += price * BigDecimal("0.05") if sale_item.imported

    round_to_nearest_five_hundredths(tax)
  end

  def round_to_nearest_five_hundredths(amount)
    ((amount * 20).ceil / BigDecimal("20")).round(2)
  end
end