require 'pry'

class CashRegister

  attr_accessor :total, :discount

  @@all = []

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(item, price, quantity=1)
    @total = @total + (price * quantity)
    quantity.times do
      @items << item
      @@all << self
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

  def items
    @items
  end

  def void_last_transaction
    @total = @total - @@all.last.total
  end

end
