class Dollar

  private
  attr_reader :amount
  public

  def initialize(number)
    @amount = Integer(number)
  end
  
  def times(operand)
    Dollar.new(amount * Float(operand))
  end
  def equals(another_object)
    self.amount.eql?(another_object.send(:amount))
  end

  def ==(other_object)
    self.amount == other_object.send(:amount)
  end
end
