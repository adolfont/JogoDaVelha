require 'Jogador'
require 'JogoDaVelha'

jogador1 = Jogador.new("Adolfo","X")
jogador2 = Jogador.new("Pedro","O")

begin 
  jogo = JogoDaVelha.new(jogador1,jogador2)

  while !(jogo.terminou?) do
     jogo.recebe_jogada
  end

  puts jogo.vencedor + " venceu"

rescue ArgumentError => e
  puts "Erro: " + e.message
end


