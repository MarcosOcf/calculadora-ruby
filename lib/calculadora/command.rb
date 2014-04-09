module Calculadora
	class Command
		def initialize str = "help"
			array_char = str.chars
			array_char.delete(nil)
			array_char.delete(" ")
			array_char.delete("")

			if array_char != ["h","e","l","p"]
				@c = Calc.new
				self.enviar_calc!(array_char)
			else
				@help = true
			end

		end

		def texto_help
		  "\tDigite a expressão desejada entre aspas \n \tutilizando os operadoes +, -, *, / \n para obter a expressão formatada com resultado"
		end

		def formatar
			@help ? texto_help : @c.formatar
		end

		def enviar_calc! array
			array.unshift(:+) if array.length % 2 != 0
			while array[0] != nil
				@c.send(array[0], array[1].to_f)
				array.shift
				array.shift

			end
		end 
	end
end


