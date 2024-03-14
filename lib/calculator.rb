class Calculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ','
    if numbers.start_with?("//")
      delimiter = numbers[2]
      numbers = numbers.split("\n")[1]
    end
    negative = [] 
    numbers.split(/#{delimiter}|\n/).map(&:to_i).each.with_index(1) do |num, index|
      negative << num if num.negative?  
      raise "negative numbers not allowed #{negative.join(",")}" if numbers.split(/#{delimiter}|\n/).map(&:to_i).size == index && !negative.blank?
    end.sum
  end
end

