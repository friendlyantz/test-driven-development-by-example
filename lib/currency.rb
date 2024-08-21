class Money
  private
  attr_reader :amount
  public

  def self.dollar(amount)
    Dollar.new(amount)
  end

  def self.franc(amount)
    Franc.new(amount)
  end

  def initialize(number)
    @amount = Integer(number)
  end

  def times(operand)
    self.class.new(amount * Float(operand))
  end

  def equals(another_object)
    self ==(another_object)
  end

  def ==(other_object)
    self.amount == other_object.send(:amount) && self.class == other_object.class
  end

end

class Dollar < Money

end

class Franc < Money

  def times(operand)
    self.class.new(amount * Float(operand))
  end

end
