require "spec_helper"
require_relative "../lib/calculadora/Command.rb"

describe Calculadora::Command do 
	
	describe "inicilializacao" do
		context "quando não informar o operador inicial" do
			it "deveria retornar a expressao formatada com resultado" do
				str = "1-2+2*3-2"
				Calculadora::Command.new(str).formatar.should eql "0.0  +  1.0  -  2.0  +  (  2.0  *  3.0  )  -  2.0  =  3.000"
			end
		end

		context "quando informar o operador inicial" do
			it "deveria retornar a expressao formatada com resultado" do
				array = "-1-2+2*3-2"
				Calculadora::Command.new(array).formatar.should eql "0.0  -  1.0  -  2.0  +  (  2.0  *  3.0  )  -  2.0  =  1.000"
			end
		end

		context "quando não informar nada" do
			it "deveria exibir o help" do
				Calculadora::Command.new.formatar.should eql "\tDigite a expressão desejada entre aspas \n \tutilizando os operadoes +, -, *, / \n para obter a expressão formatada com resultado"
			end
		end
		context "quando os operadores estiverem separados dos numeros" do
			it "deveria eliminar o espacos em branco e operar normalmente" do
				array = "-1 - 2+2 *3- 2"
				Calculadora::Command.new(array).formatar.should eql "0.0  -  1.0  -  2.0  +  (  2.0  *  3.0  )  -  2.0  =  1.000"
			end
		end
	end
end
