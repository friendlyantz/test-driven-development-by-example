module Expression
  def plus(money_added)
    Money.new(
      self.amount + money_added.amount, self.currency
    )
  end

  def reduce(to_currency)
    self
  end
end

class Money
  private
  attr_reader :currency
  public
  attr_reader :amount

  include Expression

  def self.dollar(amount)
    Dollar.new(amount, "USD")
  end

  def self.franc(amount)
    Franc.new(amount, "CHF")
  end

  def initialize(number, currency)
    @amount = Integer(number)
    @currency = String(currency)
  end

  def times(operand)
    self.class.new(amount * Float(operand), currency)
  end

  def equals(another_object)
    self ==(another_object)
  end

  def ==(other_object)
    self.amount == other_object.send(:amount) && self.currency == other_object.currency
  end

end

class Dollar < Money
  def currency = @currency
end

class Franc < Money
  def currency = @currency
end

class Bank
  def reduce(input, target_currecy)
    input.reduce(target_currecy)
  end
end

class Sum
  attr_reader :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(to_currency)
    sum = augend.amount + addend.amount
    return Money.new(sum, to_currency)
  end
end
