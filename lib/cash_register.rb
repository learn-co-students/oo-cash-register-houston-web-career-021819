require 'pry'
class CashRegister
  attr_accessor :total, :discount, :items
    @@all = []
  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @@all << self
  end
  
  def total
    @total
  end
  
  def self.all
    @@all
  end
  
  def add_item(title, price, quantity=1)
    @total += price * quantity
    
    quantity.times do
      @items << title
    end
    
  end
  
  def apply_discount
     if @discount > 0
       @total *= (100 - @discount.to_f)/100
    "After the discount, the total comes to $#{@total.to_i}."
     elsif @discount == 0
     "There is no discount to apply."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
   @total -= @@all[-1].total
  end
end
