class Calc
	
	def initialize valor = 0.0
		@pilha = []
		@pilharesultado = []
		@pilha.push(valor.to_f)
		@pilharesultado.push(valor)
		@strinresult = ""
	end
	
	def +(num)
		@pilha.push num.to_f
		@pilharesultado.push(:+)
		@pilharesultado.push(num)
		self
	end

	def -(num)
		@pilha.push (-1 * num).to_f
		@pilharesultado.push(:-)
		@pilharesultado.push(num)
		self
	end

	def /(num)
		@pilha[-1] /= num.to_f

		vartemp = @pilharesultado[-1]
		stringtemp = "(  #{vartemp}  /  #{num}  )"
		@pilharesultado[-1] = (stringtemp)
		raise ZeroDivisionError.new if @pilha[-1].nan?
		self
	end

	def *(num)
		@pilha[-1] *= num.to_f
		vartemp = @pilharesultado[-1]
		stringtemp = "(  #{vartemp}  *  #{num}  )"
		@pilharesultado[-1] = (stringtemp)
		self
	end

	def resultado
		@pilha.inject(:+)
	end

	def formatar modo=nil
		for i in @pilharesultado
			@strinresult << "#{i.to_s}  "  
		end
		@strinresult << "=  %.3f" % self.resultado.to_s
	end
	
	alias_method :somar, :+
	alias_method :subtrair, :-
	alias_method :multiplicar, :*
	alias_method :dividir, :/
end

