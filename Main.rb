require 'Jogador'
require 'JogoDaVelha'

adolfo = Jogador.new("Adolfo","X")
pedro = Jogador.new("Pedro","O")

jogo = JogoDaVelha.new(adolfo,pedro)

while !(jogo.terminou?) do
   jogo.recebe_jogada()
end

puts jogo.vencedor.to_s + " venceu"
