# frozen_string_literal: true

require_relative 'Constants'
require_relative 'SplitPie'

puts(Constants::AUTHOR)

puts(Constants::ENTER_RAISINS_CHAR)
raisinsChar = gets.chomp.strip[0]
puts(Constants::ENTER_COUNT)
count = gets.chomp.to_i

if count < 1 || raisinsChar.nil?
	puts("#{Constants::INVALID_INPUT} Number > 0 !")
	return
end

input = []
puts(Constants::ENTER_INPUT)
count.times { input << gets.chomp.gsub(/\s+/, '').chars }
result = SplitPie.Split(input, raisinsChar)

if result.nil?
	puts("#{Constants::INVALID_INPUT} This matrix may not have a solution, check the conditions, maxRaisins = 9 !")
	return
end

puts(Constants::RESULT)
resultStr = '['

result.each do |segment|
	segment.each { |row| resultStr += "\n#{row.join}" }
	resultStr += "\n,"
end

resultStr[-1] = "\n]"

puts(resultStr)
