require_relative 'lib/prompt_helper'
require_relative 'lib/shopping_cart'

if __FILE__ == $0 
puts "Welcome to the Pedro's Receipt Calculator!"

receipt_items = ShoppingCart.new

loop do 
  new_receipt_item = PromptHelper.add_new_item()
  receipt_items.add_item(new_receipt_item)

  break unless PromptHelper.collect_yes_no("Do you want to add another Item?")
end 

receipt_items.display_shopping_cart

receipt_items.display_purchase_receipt
end

