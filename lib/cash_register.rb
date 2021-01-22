class CashRegister

    attr_accessor :total, :discount, :quantity, :items_arr

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items_arr = []
    end

    def add_item(item, price, quantity = 1)
        @items_arr << {:name => item, :price => price, :quantity => quantity}
        self.calculate_total()
    end

    def apply_discount
        if @discount == 0
          return "There is no discount to apply."  
        end
       @total = @total * ((100.0 - @discount) / 100.0)
       return "After the discount, the total comes to $#{@total.to_i}." 
    end

    def items
        item_names = []
        @items_arr.each do |element|
            for i in 1..element[:quantity]
                item_names << element[:name]
            end
        end
        return item_names
    end

    def void_last_transaction
        @items_arr.pop
        self.calculate_total
    end

    def calculate_total
        total = 0
        @items_arr.each do |element| 
            total += element[:price] * element[:quantity]
        end
        @total = total
    end

end
