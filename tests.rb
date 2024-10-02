# frozen_string_literal: true

require_relative 'SplitPie'

puts('Start tests!')

# rubocop:disable Layout/ArrayAlignment, Layout/SpaceInsideArrayLiteralBrackets
arr = [	[[	%w[. .],
			%w[. . .]],

			nil],

		[[	%w[. o],
			%w[. .]],

			nil],

		[[	%w[o o o .],
			%w[o o o .],
			%w[o o o .],
			%w[o o o o]],

			nil],

		[[	nil],

			nil],

		[[	%w[o o o],
			%w[o o o],
			%w[o o o]],

		[[	%w[o]], [%w[o]], [%w[o]], [%w[o]], [%w[o]], [%w[o]], [%w[o]], [%w[o]], [%w[o]]]],

		[[	%w[. . . . . . . .],
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
			%w[. . . . . .]]]],

		[[	%w[. . . .],
			%w[. o o .],
			%w[. o o .],
			%w[. . . .]],

		[[	%w[. .],
			%w[. o]],
		[	%w[. .],
			%w[o .]],
		[	%w[. o],
			%w[. .]],
		[	%w[o .],
			%w[. .]]]],

		[[	%w[. . . . .],
			%w[. o o . .],
			%w[. . o o .],
			%w[. . . . .]],

			nil]]
# rubocop:enable Layout/ArrayAlignment, Layout/SpaceInsideArrayLiteralBrackets

arr.each do |test|
	p test[0]
	result = SplitPie.Split(test[0])
	p result
	puts("Result: #{result == test[1]}")
end

puts('Stop tests!')
