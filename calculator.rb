class Calculator
  ERROR_MSG = "negative numbers not allowed"
  @@negative_numbers = []

  def add numbers
    result = []

    numbers.each do |num|
      total = validate_input(num)
      result << total.inject(&:+)
    end

    result
  end

  def validate_input num
    input_values = num.split(/[\n,;]/).map(&:to_i)

    if input_values.any?(&:negative?)
      input_values.each do |val|
        @@negative_numbers << val if val.negative?
      end

      raise Exception.new "#{ERROR_MSG} : #{@@negative_numbers}"
    end

    input_values
  end

end

puts "======= Enter string numbers - Press 0 to exit ======"
numbers = Array.new
quit_input = ""

while quit_input != "0"
  numbers << gets.chomp
  quit_input = numbers.last
end

last_element = numbers.pop

calculator = Calculator.new
result = calculator.add(numbers)
puts
puts "====== Output ======="
puts result
