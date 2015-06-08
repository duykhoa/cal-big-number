a = "999"*10000
b = "999"*10000
c = "9"*1000

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

    result << current_sum.to_s
  end

  result << memo.to_s if memo > 0

  result.reverse
end

p sum(a, b, c)

#BENCHMARK

#require 'benchmark'

#Benchmark.bmbm do |x|
  #x.report("sum 2 small digits") { sum("1"*20, "1"*20) }
  #x.report("sum 3 small digits") { sum("1"*20, "1"*20, "9"*20) }

  #x.report("sum 2 medium digits") { sum("1"*120, "1"*120) }
  #x.report("sum 5 medium digits") { sum("1"*120, "1"*120, "9"*120, "9"*120, "9"*120) }
  #x.report("sum 8 medium digits") { sum("1"*120, "1"*120, "9"*120, "9"*120, "9"*120, "9"*120, "9"*120, "9"*120) }

  #x.report("sum 2 big digits") { sum("9"*10000, "9"*10000) }
  #x.report("sum 8 big digits") { sum("9"*10000, "9"*10000, "9"*10000, "9"*10000, "9"*10000, "9"*10000, "9"*10000, "9"*10000) }

  #x.report("sum 8 very big digits") { sum("9"*100000, "9"*100000, "9"*100000, "9"*100000, "9"*100000, "9"*100000, "9"*100000, "9"*100000) }
#end
