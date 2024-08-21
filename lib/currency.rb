class Money
  private
  attr_reader :amount, :currency
  public

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

  def plus(other_object)
    Money.new(
      self.amount + other_object.send(:amount), self.currency
    )
  end
end

class Dollar < Money
  def currency = @currency
end

class Franc < Money
  def currency = @currency
end
