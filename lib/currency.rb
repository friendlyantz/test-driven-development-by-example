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

  def equals(another_object)
    self ==(another_object)
  end

  def ==(other_object)
    self.amount == other_object.send(:amount) && self.class == other_object.class
  end

end

class Dollar < Money

  def times(operand)
    Money.dollar(amount * Float(operand))
  end

  def currency = @currency

end

class Franc < Money

  def times(operand)
    Money.franc(amount * Float(operand))
  end

  def currency = @currency

end
