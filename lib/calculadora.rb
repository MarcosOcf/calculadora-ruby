require "calculadora/version"
require "calculadora/calc"

module Calculadora

	def self.new num = 0.0
		Calculadora::Calc.new num
	end

end
