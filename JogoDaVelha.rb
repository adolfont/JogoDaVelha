class JogoDaVelha

  def initialize( jogador1, jogador2 )
    @jogadores = [jogador1, jogador2]
    @terminou = false
    @vencedor = nil
    @atual = 1
    @jogada_atual = [-1,-1]
    @tabuleiro=[
          [" "," "," "],
          [" "," "," "],
          [" "," "," "]]
  end

  def recebe_jogada
    @atual = (@atual + 1) % 2
    @jogada_atual = @jogadores[@atual].joga
    while !valida?
      puts "Jogada inválida!"
      @jogada_atual = @jogadores[@atual].joga
    end
    puts "Tabuleiro:"
    puts @tabuleiro[0].to_s
    puts @tabuleiro[1].to_s
    puts @tabuleiro[2].to_s
  end


  # ANTES DE 5 JOGADAS É IMPOSSÍVEL TER UM VENCEDOR!
  # JUNTAR OS METODOS verifica*
  # dividir os casos para eliminar os for's
  def terminou?
       x = (@jogada_atual[0].to_i) -1
       y = (@jogada_atual[1].to_i) -1
       #verificar linha atual
       #verificar coluna atual
       #verificar diagonais
       if (verifica_linha(x,y,@jogadores[@atual].simbolo))
         @terminou=true
         @vencedor=@jogadores[@atual].nome
       end
       if (verifica_coluna(x,y,@jogadores[@atual].simbolo))
         @terminou=true
         @vencedor=@jogadores[@atual].nome
       end
       if (verifica_diagonal_1(x,y,@jogadores[@atual].simbolo))
         @terminou=true
         @vencedor=@jogadores[@atual].nome
       end
       if (verifica_diagonal_2(x,y,@jogadores[@atual].simbolo))
         @terminou=true
         @vencedor=@jogadores[@atual].nome
       end

       #verificar cheio
       if (!@terminou && cheio?)
         @terminou=true
         @vencedor="A velha"
       end
    @terminou
  end

  def vencedor
    @vencedor
  end

##############################################################################

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

  def verifica_diagonal_1 (x, y, simbolo)
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

  def verifica_diagonal_2 (x, y, simbolo)
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



  def valida?
    x = @jogada_atual[0].to_i
    y = @jogada_atual[1].to_i
    
    if (x<1 || x>3 || y<1 || y>3)
       false
    else
       if @tabuleiro[x-1][y-1]!=" "
          false
       else       
          @tabuleiro[x-1][y-1]= 
              @jogadores[@atual].simbolo
          true
       end
    end
  end

end
