class Calc
	
	def initialize valor = 0.0
		@pilha = []
		@pilha_resultado = []
		@pilha.push(valor.to_f)
		@pilha_resultado.push(valor)
		@string_result = ""
	end
	
	def +(num)
		@pilha.push num.to_f
		@pilha_resultado.push(:+)
		@pilha_resultado.push(num)
		self
	end

	def -(num)
		@pilha.push (-1 * num).to_f
		@pilha_resultado.push(:-)
		@pilha_resultado.push(num)
		self
	end

	def /(num)
		@pilha[-1] /= num.to_f

		vartemp = @pilha_resultado[-1]
		@pilha_resultado[-1] = "(  #{vartemp}  /  #{num}  )"
		raise ZeroDivisionError.new if @pilha[-1].nan?
		self
	end

	def *(num)
		@pilha[-1] *= num.to_f
		vartemp = @pilha_resultado[-1]
		stringtemp = "(  #{vartemp}  *  #{num}  )"
		@pilha_resultado[-1] = (stringtemp)
		self
	end

	def zerar_pilha
		while @pilha[0] != nil
			@pilha.pop
		end
		while @pilha_resultado[0] != nil
			@pilha_resultado.pop
		end
	end

	def resultado
		@pilha.inject(:+)
	end

	def formatar modo = nil		
		if modo == :pretty
			
		else
			@string_result = formatar_sem_resultado
			@string_result << "=  %.3f" % self.resultado.to_s
		end
		# elsif modo == :pretty
		# 	for @pilharesultadolength  #concertar loop
		# 		@strinresult << "#{i.to_s}  "  
		# 	end
		# 	@strinresult << "=  %.3f" % self.resultado.to_s
		# end
	end

	def exp operacao = :+
		expressao = Calc.new
		expressao.zerar_pilha

		expressao.tap do |expressao|
			yield expressao if block_given?
		end
		expressao_parcial = expressao.send :formatar_sem_resultado
		@pilha_resultado.push("#{operacao}  (")
		@pilha_resultado.push("#{expressao_parcial})") 
		self

		case operacao
		when :+
			@pilha.push(expressao.resultado)
		when :-
			@pilha.push(expressao.resultado*-1)
		when :/
			@pilha.push(dividir(expressao.resultado))
		when :*
			@pilha.push(multiplicar(expressao.resultado))
		end
	end

	alias_method :somar, :+
	alias_method :subtrair, :-
	alias_method :multiplicar, :*
	alias_method :dividir, :/

	private
	def formatar_sem_resultado
		string = ""
		for i in @pilha_resultado
			string << "#{i.to_s}  "  
		end
		string
	end

end

