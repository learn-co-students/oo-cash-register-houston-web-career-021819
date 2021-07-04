class CashRegister

    attr_accessor :total, :discount, :items

    @@all = []

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
        @@all << self
    end

    def add_item(item, price, quantity=1)
        @total = @total + (price * quantity)
        quantity.times do 
            @items << item
        end
    end

    def apply_discount
        if @discount > 0
            @total = @total * ((100-@discount)/100.00)
            "After the discount, the total comes to $#{@total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total = @total - @@all.last.total
    end

end

#macbook_air = CashRegister.new

