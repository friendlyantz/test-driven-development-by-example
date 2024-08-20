require "dollar"

RSpec.describe "Multiplication" do
  it "multiplies" do
    five = Dollar.new(5)
    expect(five.times(2)).to eq 10
  end
end

