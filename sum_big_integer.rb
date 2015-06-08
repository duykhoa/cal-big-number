a = "999"
b = "999"
c = "9"

def max_length(nums = [])
  nums.map(&:length).max
end

def fill_up_zero(nums)
  nums.map { |num| "0" * (max_length(nums) - num.size) + num }
end

def sum_a_digit(nums, memo, position)
  result =  nums.map {|num| num[position].to_i}.inject(0) { |a, b| a + b }
  result += memo

  [result % 10, result / 10]
end

def sum(*nums)
  current_sum, memo = 0, 0
  result = ""

  max_length(nums).times do |i|
    natural_nums = fill_up_zero(nums).map(&:reverse)

    current_sum, memo = sum_a_digit(natural_nums, memo, i)
    printf "Sum of %2d %2d --> %4d, memo is %2d\n", natural_nums[0][i], natural_nums[1][i], current_sum, memo

    result << current_sum.to_s
  end

  result << memo.to_s if memo > 0

  result.reverse
end

p sum(a, b, c)
