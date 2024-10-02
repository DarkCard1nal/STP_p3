# frozen_string_literal: true

require_relative 'Constants'

# Static abstract class for dividing the raisin cake into equal portions (according to the number of raisins)
class SplitPie
	def initialize
		raise NotImplementedError
	end

	def self.Split(matrix, raisin = 'o')
		nil if IsCorrect?(matrix, raisin) == false
	end

	def self.IsCorrect?(matrix, raisin, maxRaisins = 9)
		if IsRectangular?(matrix) == false || raisin.nil?
			puts(Constants::INVALID_INPUT)
			return false
		end

		countRaisins = CountRaisinsInPie(matrix, raisin)

		if countRaisins < 2 || countRaisins > maxRaisins
			puts("#{Constants::INVALID_INPUT} 1 < Raisins < #{maxRaisins} !")
			return false
		end

		true
	end

	def self.IsRectangular?(matrix)
		return false if matrix.nil? || matrix.empty? || matrix.all?(&:nil?)

		rowLength = matrix.first.length

		matrix.all? { |row| row.length == rowLength }
	end

	def self.CountRaisinsInPie(matrix, raisin)
		return 0 if matrix.nil? || matrix.empty?

		matrix.flatten.join.downcase.count(raisin.downcase)
	end

	private_class_method :IsCorrect?
	private_class_method :IsRectangular?
	private_class_method :CountRaisinsInPie
end
