require 'pry'

class Person

  attr_accessor :changed_name_count

  def initialize
    self.changed_name_count = 0
  end

  def change_name(value)
    @first_name = value
  end

  def first_name
    @first_name
  end

  def first_name=(value)
    self.changed_name_count += 1
    @first_name = value
  end

end

class CashRegister
  attr_accessor :total, :price, :discount
  attr_reader :title, :quantity, :all

  def initialize(discount = false)
    @total = 0
    @discount = discount
    @all = []
  end

  def total
    @total
  end

  def add_item(title, price, quantity=1)
    @total = @total + (price * quantity)
    quantity.times do
      @all << title
    end
  end

  def apply_discount
    if self.discount
      @total = @total - (@total * discount/100)
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def items
    self.all
  end

  def void_last_transaction
    @total = @total - @all[-1].total
  end
end
