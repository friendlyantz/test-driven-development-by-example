module Expression
  def plus(money_added)
    Sum.new(
      self , money_added
    )
  end

  def reduce(bank, target_currency)
    rate = bank.rate(currency, target_currency)
    Money.new(amount / rate, target_currency)
  end
end

class Money
  private
  attr_reader :currency
  attr_reader :amount
  public

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

  def reduce(expression, target_currecy)
    expression.reduce(self, target_currecy)
  end

  def rate(from, to)
    return 1 if from == to

    symbol = [from, to].join("-")
    RATES[symbol]
  end


  def add_rate(from, to, rate)
    symbol = [from, to].join("-")
    RATES[symbol] = rate
  end

  private

  RATES = {}

end

class Sum
  attr_reader :augend, :addend

  def initialize(augend, addend)
    @augend = augend
    @addend = addend
  end

  def reduce(bank, to_currency)
    sum = augend.reduce(bank, to_currency).send(:amount) + addend.reduce(bank, to_currency).send(:amount)

    return Money.new(sum, to_currency)
  end
end
