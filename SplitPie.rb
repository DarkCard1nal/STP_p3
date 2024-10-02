# frozen_string_literal: true

require_relative 'Constants'

# Static abstract class для разделения пирога с изюмом на равные за площадью части (по количеству изюма)
class SplitPie
	def initialize
		raise NotImplementedError
	end

	def self.Split(matrix, raisin)
	end
end
