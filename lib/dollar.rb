class Dollar
  attr_reader :number

  def initialize(number)
    @number = Integer(number)
  end
  
  def times(operand)
    number * Float(operand)
  end

  def equals(another_object)
    self.number.eql?(another_object.number)
  end
end
