class Calc
	
	def initialize valor = 0.0
		@valor = Float(valor)
	end
	
	def +(object) #recebe objetos
		@valor += object
		self
	end

	def -(object)
		@valor -= object
		self
	end

	def /(object)
		@valor = @valor/object
		raise ZeroDivisionError.new if @valor.nan?
		
		self
	end

	def *(object)
		@valor *= object
		self
	end

	def resultado
		@valor
	end

	alias_method :somar, :+
	alias_method :subtrair, :-
	alias_method :multiplicar, :*
	alias_method :dividir, :/

end