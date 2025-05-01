class ShoppingCart
  attr_reader :receipt_items

  def initialize
    @receipt_items = []
  end

  def add_item(receipt_item)
    @receipt_items << receipt_item
  end

  def total_sales_tax
    @receipt_items.sum {|item| item.sales_tax}
  end

  def total_purchase
    @receipt_items.sum {|item| item.total_price}
  end

  def format_price(price)
    "$#{'%.2f' % price.to_f}"
  end

  def display_shopping_cart
    puts "\n--- Purchase Summary ---"
    @receipt_items.each do |item|
      name = "#{item&.quantity} #{item&.sale_item&.imported ? 'imported ' : ''}#{item&.sale_item&.name}"
      price = format_price(item&.sale_item&.price)
      puts "#{name}: #{price}"
    end
  end

  def display_purchase_receipt
    puts "\n--- Purchase Receipt ---"
    @receipt_items.each do |item|
      name = "#{item&.quantity} #{item&.sale_item&.imported ? 'imported ' : ''}#{item&.sale_item&.name}"
      price = format_price(item&.total_price)
      puts "#{name}: #{price}"
    end
    puts "Sales Tax: #{format_price(total_sales_tax)}"
    puts "Total: #{format_price(total_purchase)}"
  end
end