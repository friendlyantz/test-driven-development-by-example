require "currency"

RSpec.describe "Currency" do
  it "multiplies Dollars" do
    five = Money.dollar(5)
    expect(five.times(2)).to eq Money.dollar(10)
    expect(five.times(3)).to eq Money.dollar(15)
  end

  it "multiplies Francs" do
    five = Franc.new(5)
    expect(five.times(2)).to eq Franc.new(10)
    expect(five.times(3)).to eq Franc.new(15)
  end

  it "tests equality" do
    expect( Money.dollar(5).equals(Money.dollar(5))).to eq true
    expect( Money.dollar(5).equals(Money.dollar(6))).to eq false

    expect( Franc.new(5).equals(Franc.new(5))).to eq true
    expect( Franc.new(5).equals(Franc.new(6))).to eq false

    expect( Franc.new(5).equals(Money.dollar(5))).to eq false
  end
end

