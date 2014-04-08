module Calculadora
	class Command
		def initialize str
			@c = Calc.new
			self.enviar_calc(str)
		end

		def formatar
			@c.formatar
		end

		def enviar_calc  str
			while str != ""
				@c.send(str[0].to_sym,str[1].to_f)
				str = str.slice(2..-1)
				
			end
		end 
	end
end


