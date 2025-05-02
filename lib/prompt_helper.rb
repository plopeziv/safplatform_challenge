require_relative 'sale_item'
require_relative 'receipt_item'

module PromptHelper
  def self.add_new_item()
    name = PromptHelper.collect_user_input("\nWhat item would you like to add?")
    isFood = PromptHelper.collect_yes_no("Is this item food?")
    isBook =PromptHelper.collect_yes_no("Is this item a book")
    isMedical = PromptHelper.collect_yes_no("Is this item used for medical purposes?")
    isImported = PromptHelper.collect_yes_no("Is this item imported?")
    price = PromptHelper.collect_quantity("How much does this item cost?")

    newSalesItem = SaleItem.new(name: name, isFood: isFood, isBook: isBook, isMedical: isMedical, imported: isImported, price: price)

    quantity = PromptHelper.collect_quantity("How many #{newSalesItem.name} would you like?")

    newReceiptItem = ReceiptItem.new(sale_item: newSalesItem, quantity: quantity)

    puts "\nItem Summary:"
    puts "#{quantity} #{isImported ? 'imported ' : ''}#{newSalesItem.name}: $#{newSalesItem.price}\n"

    return newReceiptItem
  end

  def self.collect_user_input(question)
    print("#{question}: ")
    return gets.chomp.strip
  end

  def self.collect_yes_no(question)
    loop do
    print ("#{question} (y/n): ")
    user_response = gets.chomp.strip.downcase

    return true if user_response =='y'
    return false if user_response == 'n'

    puts "Invalid answer. Please select either (y/n)"
    end
  end

  def self.collect_quantity(question)
    loop do 
      print "#{question}: "
      input = gets.chomp.strip
  
      if input.match?(/^\d+(\.\d+)?$/) && input.to_f > 0
        return input.to_f
      end
  
      puts "Invalid quantity. Please enter a positive number (e.g. 1, 2.5, 32.74)."
    end
  end
end