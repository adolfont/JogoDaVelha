class JogoDaVelha

  def initialize( jogador1, jogador2 )
    @jogadores = [jogador1, jogador2]
    @terminou = false
    @vencedor = 0
    @atual = 0
    @tabuleiro=[
          [" "," "," "],
          [" "," "," "],
          [" "," "," "]]
  end

  def terminou?
    for i in 0..1
       #verificar linhas
       if (verifica_linhas(@jogadores[i]))
         @terminou=true
         @vencedor=@jogadores[i].nome
       end
       #verificar colunas
       if (verifica_colunas(@jogadores[i]))
         @terminou=true
         @vencedor=@jogadores[i].nome
       end
       #verificar diagonais
       if (verifica_diagonal_1(@jogadores[i]))
         @terminou=true
         @vencedor=@jogadores[i].nome
       end
       if (verifica_diagonal_2(@jogadores[i]))
         @terminou=true
         @vencedor=@jogadores[i].nome
       end
       #verificar cheio
       if (cheio?)
         @terminou=true
         @vencedor="A velha"
       end
    end
    @terminou
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

  def verifica_linhas(jogador)
    for i in 0..2
      resultado = true
      for j in 0..2
         if @tabuleiro[i][j]!=jogador.simbolo
           resultado = false
         end
      end
      if (resultado)
        return resultado
      end 
    end
    return resultado
  end

  def verifica_colunas(jogador)
    for i in 0..2
      resultado = true
      for j in 0..2
         if @tabuleiro[j][i]!=jogador.simbolo
           resultado = false
         end
      end
      if (resultado)
        return resultado
      end 
    end
    return resultado
  end

  def verifica_diagonal_1(jogador)
    for i in 0..2
      resultado = true
      if @tabuleiro[i][i]!=jogador.simbolo
           resultado = false
      end
    end
    resultado
  end

  def verifica_diagonal_2(jogador)
    for i in 0..2
      resultado = true
      if @tabuleiro[2-i][i]!=jogador.simbolo
           resultado = false
      end
    end
    resultado
  end


  def recebe_jogada
    jogada = @jogadores[@atual].joga
    while !valida?(jogada)
      puts "Jogada inválida!"
      jogada = @jogadores[@atual].joga
    end
    puts @tabuleiro[0].to_s
    puts @tabuleiro[1].to_s
    puts @tabuleiro[2].to_s
    @atual = (@atual + 1) % 2
  end

  def vencedor
    @vencedor
  end

  def valida?(jogada)
    x = jogada[0].to_i
    y = jogada[1].to_i
    
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
