class Calc
	
	def initialize valor = 0.0
		@pilha = []
		@pilha.push(valor.to_f)
	end
	
	def +(num)
		@pilha.push num.to_f
		self
	end

	def -(num)
		@pilha.push (-1 * num).to_f
		self
	end

	def /(num)
		@pilha[-1] /= num.to_f
		raise ZeroDivisionError.new if @pilha[-1].nan?
		self
	end

	def *(num)
		@pilha[-1] *= num.to_f
		self
	end

	def resultado
		@pilha.inject(:+)
	end

	alias_method :somar, :+
	alias_method :subtrair, :-
	alias_method :multiplicar, :*
	alias_method :dividir, :/
end

