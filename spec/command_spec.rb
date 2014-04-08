require "spec_helper"
require_relative "../lib/calculadora/Command.rb"

describe Calculadora::Command do 
	
	describe "Inicilializacao" do
		it "Deveria retornar a expressao formatada com resultado" do
			array = "+  1 -2 + 2*3-2"
			array.delete!(" ")
			Calculadora::Command.new(array).formatar.should eql "0.0  +  1.0  -  2.0  +  (  2.0  *  3.0  )  -  2.0  =  3.000"
		end
	end
end
