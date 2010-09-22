class JogoDaVelha


### MELHOR USAR ARRAY PARA JOGADORES
  def initialize( jogador1, jogador2 )
    @jogador1 = jogador1
    @jogador2 = jogador2
    @terminou = false
    @vencedor = 0
    @atual = jogador1

    @tabuleiro=[[0,0,0],[0,0,0],[0,0,0]]
  end

  def terminou?

    #para cada jogador
    for i in 1..2
       #verificar linhas
       if (verifica_linhas(i))
         @terminou=true
         @vencedor=i
       end
       #verificar colunas
       #verificar diagonais
       #verificar cheio
    end
   
    @terminou
  end

  def verifica_linhas(valor)
    for i in 0..2
      resultado = true
#      puts "COMECANDO a procurar valor "+ valor.to_s + " na linha:" + i.to_s
      for j in 0..2
         if @tabuleiro[i][j]!=valor

           resultado = false
         end
      end
#      puts "RESULTADO =" + resultado.to_s
      if (resultado)
        return resultado
      end 
    end
    return resultado
  end

  def recebe_jogada
    jogada = @atual.joga
    while !valida?(jogada)
      puts "Jogada inválida!"
      jogada = @atual.joga
    end
    puts @tabuleiro.to_s

#    puts "Jogada: " + jogada.to_s
 
    if (@atual == @jogador1)
       @atual = @jogador2
    else
       @atual = @jogador1
    end
 
  end

  def vencedor
    @vencedor
  end

  def valida?(jogada)
    x = jogada[0].to_i
    y = jogada[1].to_i
    
#    puts "x = " + x.to_s + " e y = " + y.to_s
    if (x<1 || x>3 || y<1 || y>3)
       false
    else
       if @tabuleiro[x-1][y-1]!=0
          false
       else       
          @tabuleiro[x-1][y-1]= numero_jogador_atual
          true
       end
    end
  end

  def numero_jogador_atual
    if (@atual == @jogador1)
       1
    else
       2
    end
  end
end
