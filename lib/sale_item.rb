class SaleItem
    attr_accessor :name, :isBook, :isFood, :isMedical, :imported, :price
    attr_reader :exempt

    def initialize(name:, isBook: false, isFood: false, isMedical: false, imported: false, price:)
        @name = name
        @isBook = isBook
        @isFood = isFood
        @isMedical = isMedical
        @imported = imported
        @exempt = is_exempt?
        @price = price
    end

    private

    def is_exempt?
        isBook || isFood || isMedical
    end
end