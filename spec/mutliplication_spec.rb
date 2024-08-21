require "currency"

RSpec.describe "Currency" do
  it "multiplies Dollars" do
    five = Money.dollar(5)
    expect(five.times(2)).to eq Money.dollar(10)
    expect(five.times(3)).to eq Money.dollar(15)
  end

  it "multiplies Francs" do
    five = Money.franc(5)
    expect(five.times(2)).to eq Money.franc(10)
    expect(five.times(3)).to eq Money.franc(15)
  end

  it "tests equality" do
    expect( Money.dollar(5).equals(Money.dollar(5))).to eq true
    expect( Money.dollar(5).equals(Money.dollar(6))).to eq false

    expect( Money.franc(5).equals(Money.franc(5))).to eq true
    expect( Money.franc(5).equals(Money.franc(6))).to eq false

    expect( Money.franc(5).equals(Money.dollar(5))).to eq false
  end

  it "display correct currencies" do
    expect(Money.dollar(1).currency).to eq "USD"
    expect(Money.franc(1).currency).to eq "CHF"
  end
end

