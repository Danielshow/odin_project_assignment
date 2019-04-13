require './lib/calculator'
RSpec.describe Calculator do
  describe '#add' do
    it 'returns the sum of two numbers' do
      calculator = Calculator.new
      expect(calculator.add(2, 3)).to eql(5)
    end

    it "returns the sum of more than two numbers" do
      calculator = Calculator.new
      expect(calculator.add(2, 4, 5)).to eql(11)
    end
  end

  describe '#subtract' do
    it 'returns the subtraction of two numbers' do
      calculator = Calculator.new
      expect(calculator.subtract(5, 6)).to eql(-1)
    end
  end

  describe '#multiply' do
    it 'returns the multiplication of two numbers' do
      calculator = Calculator.new
      expect(calculator.multiply(4, 5)).to eql(20)
    end
  end

  describe "#divide" do
    it 'returns the division of two numbers' do
      calculator = Calculator.new
      expect(calculator.divide(20, 5)).to eql(4)
    end
  end
end
