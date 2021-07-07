class CashRegister
  def initialize (discount=0)
    @total = 0
    @discount = discount
    @item_array = []
  end


  def discount
    @discount
  end

  def total
    @total
  end

  def total=(value)
    @total = value
  end

  def add_item (title, price, quantity=1)
    @total += price * quantity
    quantity.times {@item_array << title}
    @last_item = [title,price,quantity]
  end

  def apply_discount
    if @discount != 0
      @total = @total * (100 - @discount) / 100
      return "After the discount, the total comes to $#{@total}."
    else
      return "There is no discount to apply."
    end
  end

  def items
    return @item_array
  end

  def void_last_transaction
    @total -= @last_item[1] * @last_item[2]
    @last_item[2].times {@item_array.pop}
  end

end
