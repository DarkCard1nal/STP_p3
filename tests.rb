# frozen_string_literal: true

require_relative 'Converter'
require_relative 'SplitPie'

puts('Start tests!')

# rubocop:disable Layout/ArrayAlignment, Layout/SpaceInsideArrayLiteralBrackets
arr = [[[	%w[. . . . . . . .],
			%w[. . o . . . . .],
			%w[. . . o . . . .],
			%w[. . . . . . . .]],

		[[	%w[. . . . . . . .],
			%w[. . o . . . . .]],
		[	%w[. . . o . . . .],
			%w[. . . . . . . .]]]],

		[[	%w[. o . . . . . .],
			%w[. . . . . . o .],
			%w[. . . . o . . .],
			%w[. . o . . . . .]],

		[[	%w[. o . . . . . .]],
		[	%w[. . . . . . o .]],
		[	%w[. . . . o . . .]],
		[	%w[. . o . . . . .]]]],

		[[	%w[. o . o . . . .],
			%w[. . . . . . . .],
			%w[. . . . o . . .],
			%w[. . . . . . . .],
			%w[. . . . . o . .],
			%w[. . . . . . . .]],

		[[	%w[. o],
			%w[. .],
			%w[. .],
			%w[. .],
			%w[. .],
			%w[. .]],
		[	%w[. o . . . .],
			%w[. . . . . .]],
		[	%w[. . o . . .],
			%w[. . . . . .]],
		[	%w[. . . o . .],
			%w[. . . . . .]]]]]
# rubocop:enable Layout/ArrayAlignment, Layout/SpaceInsideArrayLiteralBrackets

arr.each do |test|
	p test[0]
	result = SplitPie.Split(test[0], 'o')
	p result
	puts("Result: #{result == test[1]}")
end

puts('Stop tests!')
