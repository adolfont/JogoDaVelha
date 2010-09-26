# Copyleft Adolfo Neto
# 26-09-2010
#
# Obs.: Este é um código escrito por alguém que está aprendendo Ruby
# e com certa pressa.
# Aceito sugestões para melhorias.

class Jogada
  attr_reader :linha, :coluna
  def initialize( linha, coluna )
    @linha = linha
    @coluna = coluna
  end
end


class JogoDaVelha

  def initialize( jogador1, jogador2 )

    @jogadores = [jogador1, jogador2]
    if (jogador1.simbolo == jogador2.simbolo)
      raise ArgumentError, "Não são permitidos dois jogadores com o mesmo símbolo!"
    end

    @terminou = false
    @vencedor = nil
    @contador_de_jogadas = 1
    @jogada_atual = Jogada.new(-1,-1)
    @tabuleiro=[
          [" "," "," "],
          [" "," "," "],
          [" "," "," "]]
  end

  def recebe_jogada
    @contador_de_jogadas = @contador_de_jogadas + 1
    jogador_da_vez = @contador_de_jogadas % 2
    @jogada_atual = interface_recebe_jogada(@jogadores[jogador_da_vez].nome)

    while !jogada_eh_valida?
      puts "Jogada inválida!"
      @jogada_atual = interface_recebe_jogada(@jogadores[jogador_da_vez].nome)
    end
   
    # registra a jogada no tabuleiro
    @tabuleiro[@jogada_atual.linha][@jogada_atual.coluna]= @jogadores[jogador_da_vez].simbolo

    puts "Tabuleiro:"
    puts @tabuleiro[0].to_s
    puts @tabuleiro[1].to_s
    puts @tabuleiro[2].to_s
  end

  # TODO:
  # JUNTAR OS METODOS verifica* (será mesmo necessário?)
  # dividir os casos para eliminar os for's (será mesmo necessário?)
  def terminou?
       # antes de 5 jogadas é impossível haver um vencedor
       if (@contador_de_jogadas < 6)
          return false
       end
    
       jogador_da_vez = @contador_de_jogadas % 2

       # após uma jogada, verificar se o símbolo colocado fecha uma linha/coluna/diagonal
       if (  
             verifica_linha(@jogada_atual.linha,@jogada_atual.coluna,
			@jogadores[jogador_da_vez].simbolo) or
             verifica_coluna(@jogada_atual.linha,@jogada_atual.coluna,
			@jogadores[jogador_da_vez].simbolo) or
	     verifica_diagonal_principal(@jogada_atual.linha,@jogada_atual.coluna,
			@jogadores[jogador_da_vez].simbolo) or
             verifica_diagonal_secundaria(@jogada_atual.linha,@jogada_atual.coluna,
			@jogadores[jogador_da_vez].simbolo)
	  )
         @terminou=true
         @vencedor=@jogadores[jogador_da_vez].nome
       else
         #verificar se a velha ganhou
         if cheio?
           @terminou=true
           @vencedor="A velha"
         end
       end
    @terminou
  end

  def vencedor
    @vencedor
  end

##############################################################################

  def interface_recebe_jogada (nome_jogador)
    print "Digite a jogada \n(um par 'x y' com x e y entre 1 e 3) de " + nome_jogador + ": "
    resultado = gets.split
    Jogada.new(resultado[0].to_i-1, resultado[1].to_i-1)
  end

  def verifica_linha (x, y, simbolo)
     resultado=true
     for i in 0..2
       if @tabuleiro[x][i]!=simbolo
          resultado=false
       end
     end
     resultado
  end

  def verifica_coluna (x, y, simbolo)
     resultado=true
     for i in 0..2
       if @tabuleiro[i][y]!=simbolo
          resultado=false
       end
     end
     resultado
  end

  def verifica_diagonal_principal (x, y, simbolo)
     if (x!=y)
       return false
     end
     resultado=true
     for i in 0..2
       if @tabuleiro[i][i]!=simbolo
          resultado=false
       end
     end
     resultado
  end

  def verifica_diagonal_secundaria (x, y, simbolo)
     if ((x+y)!=2)
       return false
     end
     resultado=true
     for i in 0..2
       if @tabuleiro[2-i][i]!=simbolo
          resultado=false
       end
     end
     resultado
  end

  def cheio?
    for i in 0..2
      for j in 0..2
        if @tabuleiro[i][j]==" "
          return false
        end
      end
    end
    true
  end

  def jogada_eh_valida?
    if (@jogada_atual.linha<0 or @jogada_atual.linha>2 or
        @jogada_atual.coluna<0 or @jogada_atual.coluna>2)
       # posição fora do tabuleiro    
       false
    else
       if @tabuleiro[@jogada_atual.linha][@jogada_atual.coluna]!=" "
          # posição ocupada
          false
       else       
          # posição livre
          true
       end
    end
  end

end
