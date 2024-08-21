require "dollar"

RSpec.describe "Multiplication" do
  it "multiplies" do
    five = Dollar.new(5)
    expect(five.times(2)).to eq Dollar.new(10)
    expect(five.times(3)).to eq Dollar.new(15)
  end

  it "tests equality" do
    expect(
      Dollar.new(5).equals(Dollar.new(5))
    ).to eq true

    expect(
      Dollar.new(5).equals(Dollar.new(6))
    ).to eq false
  end
end

