class ShoppingCart
  attr_reader :receipt_items

  def initialize()
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

  def display_shopping_cart
    puts "\n--- Purchase Summary ---"
    @receipt_items.each do |item|
      puts"#{item&.quantity} #{item&.sale_item&.imported ? 'imported ' : ''}#{item&.sale_item&.name}: $#{item&.sale_item&.price}"
    end
  end

  def display_purchase_receipt
    puts "\n--- Purchase Receipt ---"
    @receipt_items.each do |item|
      puts"#{item&.quantity} #{item&.sale_item&.imported ? 'imported ' : ''}#{item&.sale_item&.name}: $#{item.total_price}"
    end
    puts "Sales Tax: $#{'%.2f' % total_sales_tax}"
    puts "Total: $#{'%.2f' % total_purchase}"
  end

end