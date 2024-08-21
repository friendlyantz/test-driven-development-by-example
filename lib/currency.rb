class Money
  private
  attr_reader :amount
  public

  def initialize(number)
    @amount = Integer(number)
  end

  def equals(another_object)
    self ==(another_object)
  end

  def ==(other_object)
    self.amount == other_object.send(:amount)
  end

end

class Dollar < Money

  def times(operand)
    Dollar.new(amount * Float(operand))
  end

end

class Franc < Money

  def times(operand)
    self.class.new(amount * Float(operand))
  end

end
