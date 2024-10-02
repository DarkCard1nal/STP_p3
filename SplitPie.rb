# frozen_string_literal: true

require_relative 'Constants'

# Static abstract class for dividing the raisin cake into equal portions (according to the number of raisins)
class SplitPie # rubocop:disable Metrics/ClassLength
	def initialize
		raise NotImplementedError
	end

	# Main static public method that divides the matrix on the input into equal square sized parts containing
	# one raisin each, returns an array of them, or returns nil if it fails
	def self.Split(matrix, raisin = 'o', maxRaisins = 9)
		return nil if IsCorrect?(matrix, raisin, maxRaisins) == false

		raisinsIndex = RaisinsIndex(matrix, raisin)
		countRaisins = CountRaisinsInPie(matrix, raisin)
		square = MatrixProperties(matrix)[0]

		return nil unless (square % countRaisins).zero?

		square /= countRaisins
		divisors = Divisors(square)

		SeparateSegments(matrix, raisinsIndex, divisors.reverse.zip(divisors))
	end

	# Static method checks the matrix for correctness and compliance with certain conditions
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

	# Static method checks if a matrix is a rectangle
	def self.IsRectangular?(matrix)
		return false if matrix.nil? || matrix.empty? || matrix.all?(&:nil?)

		rowLength = matrix.first.length

		matrix.all? { |row| row.length == rowLength }
	end

	def self.CountRaisinsInPie(matrix, raisin)
		return 0 if matrix.nil? || matrix.empty?

		matrix.flatten.join.downcase.count(raisin.downcase)
	end

	def self.RaisinsIndex(matrix, raisin)
		matrix.each_with_index.flat_map do |row, rowIndex|
			row.map.with_index do |element, colIndex|
				[rowIndex, colIndex] if element.casecmp(raisin).zero?
			end.compact
		end
	end

	def self.Divisors(n)
		(1..n).select { |i| (n % i).zero? }
	end

	def self.MatrixProperties(matrix, startElement = [0, 0])
		row = matrix.size - startElement[0]
		col = matrix[row - 1].size - startElement[1]
		square = row * col

		[square, row, col]
	end

	def self.FindFirstNonNil(matrix)
		matrix.each_with_index do |row, rowIndex|
			row.each_with_index do |element, colIndex|
				return [rowIndex, colIndex] unless element.nil?
			end
		end

		nil
	end

	def self.IncludesInSubarray?(indexs, finishElement, startIndex = 0, startElement = [0, 0])
		indexs[startIndex..].each do |index|
			if (index[0] >= startElement[0] && index[0] < finishElement[0]) &&
						(index[1] >= startElement[1] && index[1] < finishElement[1])
				return true
			end
		end

		false
	end

	# Static method separates the submatrix, leaves nil in place of its elements,
	# and returns a new matrix and the selected submatrix
	def self.Submatrix(matrix, finishElement, startElement = [0, 0])
		matrixCopy = matrix.map(&:dup)
		submatrix = SubmatrixSlice(matrix, finishElement, startElement)

		(startElement[0]...finishElement[0]).each do |i|
			(startElement[1]...finishElement[1]).each do |j|
				matrixCopy[i][j] = nil
			end
		end

		[matrixCopy, submatrix]
	end

	def self.SubmatrixSlice(matrix, finishElement, startElement = [0, 0])
		matrix[startElement[0]...finishElement[0]].map { |row| row[startElement[1]...finishElement[1]] }
	end

	# Static method cuts the matrix into segments recursively, returns an array of segments or nil if unsuccessful
	def self.SeparateSegments(matrix, indexs, rangeArr, count = indexs.length, result = [])
		return result if count < 1

		start = FindFirstNonNil(matrix)
		square, maxRow, maxCol = MatrixProperties(matrix, start)
		current = indexs[indexs.length - count]

		return nil if square < rangeArr[0][0]

		SeparateSegmentsAreaSelection(matrix, indexs, rangeArr, maxRow, maxCol, current, start, count, result)
	end

	# rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/ParameterLists

	# The static method part of SeparateSegments that searches through various variants of segment shapes
	# from rangeArr until it finds one that matches the conditions, then recursively calls SeparateSegments
	def self.SeparateSegmentsAreaSelection(matrix, indexs, rangeArr, maxRow, maxCol, current, start, count, result)
		rangeArr.each do |a, b|
			next if a > maxCol || b > maxRow || current[0] >= b + start[0] || current[1] >= a + start[1]
			next if IncludesInSubarray?(indexs, [b + start[0], a + start[1]], indexs.length - count + 1, start)

			matrixCopy, submatrix = Submatrix(matrix, [b + start[0], a + start[1]], start)
			result << submatrix

			return result unless SeparateSegments(matrixCopy, indexs, rangeArr, count - 1, result).nil?

			result.pop
		end

		nil
	end
	# rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/ParameterLists

	private_class_method :IsCorrect?
	private_class_method :IsRectangular?
	private_class_method :CountRaisinsInPie
	private_class_method :RaisinsIndex
	private_class_method :Divisors
	private_class_method :MatrixProperties
	private_class_method :FindFirstNonNil
	private_class_method :IncludesInSubarray?
	private_class_method :Submatrix
	private_class_method :SubmatrixSlice
	private_class_method :SeparateSegments
	private_class_method :SeparateSegmentsAreaSelection
end
