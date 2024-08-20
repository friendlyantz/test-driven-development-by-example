class Dollar
  attr_reader :number

  def initialize(number)
    @number = Integer(number)
  end
  
  def times(operand)
    number * Float(operand)
  end
end
