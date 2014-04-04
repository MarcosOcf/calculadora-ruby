require "spec_helper"
require_relative "../src/calculadora.rb"

describe Calc do
	
	describe "inicializacao" do
		it "deveria comecar com o valor zero" do
			Calc.new.resultado.should eql 0.0
		end

		it "deveria permitir configurar o valor inicial" do
			Calc.new(20).resultado.should eql 20.0
		end
	end

	describe "+" do
		subject { Calc.new }

		it "Deveria incrementar o valor da calculadora com o valor recebido" do
			subject.somar 10
			subject.somar 5			
			subject.resultado.should eql 15.0
		end

		it "Deveria permitir encadear outro somar" do
			subject.somar(10).somar(2)
			subject.resultado.should eql 12.0
		end

		it "Deveria permitir encadear subtrair" do
			subject.somar(10).subtrair(2)
			subject.resultado.should eql 8.0
		end

		it "Deveria permitir encadear multiplicar" do
			subject.somar(2).multiplicar(3).resultado.should eql 6.0
		end

		it "Deveria permitir encadear dividir" do
			subject.somar(2).dividir(2).resultado.should eql 1.0
		end

		it "Deveria reponder pelo método +" do
			subject.should respond_to :+
			subject.+(2).resultado.should eql Calc.new.somar(2).resultado
		end
	end

	describe "-" do
		subject { Calc.new }

		it "Deveria subtrair o valor da calculadora com o valor recebido" do
			subject.subtrair(2).resultado.should eql -2.0
		end

		it "Deveria permitir encadear outro subtrair" do
			subject.subtrair(1).subtrair(1).resultado.should eql -2.0
		end

		it "Deveria permitir encadear somar" do
			subject.subtrair(10).somar(5).resultado.should eql -5.0
		end

		it "Deveria permitir encadear multiplicar" do
			subject.subtrair(10).multiplicar(-1).resultado.should eql 10.0
		end			
		it "Deveria permitir encadear dividir" do
			subject.subtrair(10).dividir(2).resultado.should eql -5.0
		end
		it "Deveria reponder pelo método -" do
			subject.should respond_to :-
			subject.-(2).resultado.should eql Calc.new.subtrair(2).resultado
		end
	end

	describe "*" do	
		subject { Calc.new }

		describe "Quando o valor recebido for zero" do
			it "Deveria ter zero como resultado" do
				subject.somar(2)
				subject.multiplicar(0).resultado.should eql 0.0
			end

			describe "Quando o valor acumulado for zero" do
				it "Deveria ter zero como resultado" do
					subject.multiplicar(0).resultado.should eql 0.0
				end
			end
		end
	
		it "Deveria permitir encadear soma" do
			subject.somar(2)
			subject.multiplicar(2).somar(3).resultado.should eql 7.0
		end

		it "Deveria permitir encadear subtrair" do
			subject.somar(2)
			subject.multiplicar(2).subtrair(3).resultado.should eql 1.0
		end

		it "Deveria permitir encadear multiplicar" do
			subject.somar(2)
			subject.multiplicar(2).multiplicar(3).resultado.should eql 12.0
		end

		it "Deveria permitir encadear dividir" do
			subject.somar(2)
			subject.multiplicar(6).dividir(4).resultado.should eql 3.0
		end

		describe "Quando encadear metodos" do
			it "Deveria dar prioridade a multiplicacao em relacao a somar" do
				subject.somar(2).somar(3).multiplicar(3).resultado.should eql 11.0
			end
			it "Deveria dar prioridade a mutiplicacao em relacao a subtrair" do
				subject.subtrair(2).subtrair(3).multiplicar(3).resultado.should eql -11.0
			end
		end

		it "Deveria reponder pelo método *" do
			subject.should respond_to :*
			subject.somar(2).*(2).resultado.should eql Calc.new.somar(2).multiplicar(2).resultado
		end
 end

	describe "/" do
		describe "Quando o valor acumulado for um inteiro" do
			describe "E o valor passado for inteiro, com resultado inteiro" do
				it "Deveria dividir o valor da calculadora pelo valor aculumado" do
					subject.somar(10)
					subject.dividir(2).resultado.should eql 5.0
				end
			end

			describe "E o valor passado for inteiro, com resultado decimal" do
				it "Deveria obter resultado decimal" do
					subject.somar(9)
					subject.dividir(2).resultado.should eql 4.5
				end
			end
			
			describe "E o valor passado for um decimal" do
				it "Deveria dividir o valor da calculdora pelo valor acumulado encontrando um decimal" do
					subject.somar(5)
					subject.dividir(2.5).resultado.should eql 2.0
				end
			end
		end

		describe "Quando o valor acumulado for decimal" do
			it "Deveria dividir o valor da calculadora pelo valor inteiro, encontrando um decimal" do
				subject.somar(10.0)
				subject.dividir(2).resultado.should eql 5.0
			end
		end

		describe "Quando o valor acumulado for zero" do
			it "Deveria retornar zero" do
				subject.dividir(3).resultado.should eql 0.0
			end
		end

		describe "Quando o valor recebido for zero" do
			it "Deveria retornar " do
				subject.resultado.should eql 0.0
				-> { subject.dividir(0) }.should raise_error ZeroDivisionError
			end
		end
	

		it "Deveria permitir encadear soma" do
			subject.somar(2)
			subject.dividir(2).resultado.should eql 1.0
		end

		it "Deveria permitir encadear subtrair" do
			subject.somar(2)
			subject.dividir(2).subtrair(3).resultado.should eql -2.0
		end
		
		it "Deveria permitir encadear multiplicar" do
			subject.somar(2)
			subject.dividir(2).multiplicar(2).resultado.should eql 2.0
		end
		
		it "Deveria permitir encadear dividir" do
			subject.somar(12)
			subject.dividir(6).dividir(2).resultado.should eql 1.0
		end

		describe "Quando encadear metodos" do
			it "Deveria dar prioridade a dividir em relacao a somar" do
				subject.somar(10).somar(9).dividir(3).resultado.should eql 13.0
			end
		
			it "Deveria dar prioridade a dividir em relacao a subtrair" do
				subject.subtrair(10).subtrair(9).dividir(3).resultado.should eql -13.0
			end
		end

		
		it "Deveria reponder pelo método /" do
			subject.should respond_to :/
			subject.somar(2)./(2).resultado.should eql Calc.new.somar(2).dividir(2).resultado
		end
	end
	
	describe "resultado" do
		it "Deveria retornar o valor atual" do
			Calc.new.resultado.should eql 0.0
			Calc.new(20).resultado.should eql 20.0
		end
	end

	describe "formatar" do
		describe "Quando nao for passado parametro" do

			it "Deveria exibir o formato de equacoes com parenteses e resultado" do
				Calc.new.somar(2).somar(4).multiplicar(2).subtrair(3).formatar.should eql "0.0  +  2  +  (  4  *  2  )  -  3  =  7.000"
			end

			it "Deveria encadear multiplicacoes e dvisoes criando parenteses" do
				Calc.new.somar(2).somar(4).multiplicar(2).multiplicar(3).formatar.should eql "0.0  +  2  +  (  (  4  *  2  )  *  3  )  =  26.000"
			end
		end
	end
end