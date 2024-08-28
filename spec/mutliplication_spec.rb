require "currency"

RSpec.describe "Currency" do
  it "multiplies Dollars" do
    five = Money.dollar(5)
    expect(five.times(2)).to eq Money.dollar(10)
    expect(five.times(3)).to eq Money.dollar(15)
  end

  it "tests equality" do
    expect( Money.dollar(5).equals(Money.dollar(5))).to eq true
    expect( Money.dollar(5).equals(Money.dollar(6))).to eq false

    expect( Money.franc(5).equals(Money.dollar(5))).to eq false
  end

  it "tests different class equality" do
    expect( Money.new(5, "USD").equals(Money.dollar(5))).to eq true
    expect( Money.new(5, "CHF").equals(Money.franc(5))).to eq true
  end

  it "display correct currencies" do
    expect(Money.dollar(1).currency).to eq "USD"
    expect(Money.franc(1).currency).to eq "CHF"
  end

  describe "addition" do
    it "adds correctly" do
      expect( Money.dollar(5).plus(Money.dollar(5))).to eq Money.dollar(10)
    end

    it "produces Sum object as a result" do
      five = Money.dollar(5)
      result =  five.plus(five)
      sum_obj = Sum.new(five, five)
      expect(five).to eq sum_obj.augend
      expect(five).to eq sum_obj.addend
    end
  end

  describe 'Bank and Sum' do
    it 'converts correctly' do
      bank = Bank.new
      expect(
             bank.reduce(Money.dollar(1), "USD")
            ).to eq Money.dollar(1)
    end

    it "converts expression like SUm as well" do
      bank = Bank.new
      sum_expression = Sum.new(
        Money.dollar(3), Money.dollar(4)
      )
      expect(
             bank.reduce(sum_expression, "USD")
            ).to eq Money.dollar(7)
    end
  end

  it 'Reduce Money Different Currency' do
    pending
    bank = Bank.new
    bank.add_rate("CHF", "USD", 2)
    result = bank.reduce(Money.franc(2), "USD")
    expect(result).to eq Money.dollar(1)
  end


  it "can be converted via Bank" do
    five = Money.dollar(5)
    sum =  five.plus(five)
    bank = Bank.new
    reduced = bank.reduce(sum, "USD")
    expect(reduced).to eq Money.dollar(10)
  end
end

