require_relative '../calculator'

RSpec.describe Calculator do

  let(:num1) { "1,2" }
  let(:num2) { "1\n,3" }
  let(:num3) { "" }
  let(:calculator) { Calculator.new }

  describe '#validate_input' do
    it 'allows input with comma seperated string' do
      expect(num1).to eq("1,2")
      expect(num2).to eq("1\n,3")
    end

    it 'allows input with integers' do
      arr1 = num1.split(/[\n,]/).map(&:to_i)
      expect(arr1).to eq([1,2])
    end

    it 'allows input with new line' do
      arr2 = num2.split(/[\n,]/).map(&:to_i)
      expect(arr2).to eq([1,0,3])
    end

    it 'allows input with empty string' do
      arr3 = num3.split(/[\n,]/).map(&:to_i)
      expect(arr3).to eq([])
    end
  end

  describe '#add' do
    it 'returns the sum of two numbers' do
      numbers = ["1,2"]
      expect(calculator.add(numbers)).to eq([3])
    end

    it 'returns the sum of two numbers with new line chars' do
      numbers = ["1\n,2"]
      expect(calculator.add(numbers)).to eq([3])
    end

    it 'returns the sum of mutiple numbers with new line chars' do
      numbers = ["1\n,2", "9,0,1"]
      expect(calculator.add(numbers)).to eq([3, 10])
    end

    # it 'returns the sum of two numbers with negative numbers' do
    #   numbers = ["1\n,2,-3"]
    #   # expect(calculator.add(numbers)).to raise_exception
    #   # expect(calculator.add(numbers)).to raise_error(Exception::RuntimeError, "negative numbers not allowed")
    #   expect(calculator.add(numbers)).to raise_exception('negative numbers not allowed')
    # end

    it 'return the sum of any amount of numbers' do
      numbers = ["", "1", "1,5", "2,3", "4\n,5", "", "7,8"]
      expect(calculator.add(numbers)).to eq([nil, 1, 6, 5, 9, nil, 15])
    end

  end

end
