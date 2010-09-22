class Jogador

  def initialize( nome )
    @nome = nome
  end

  def nome
    @nome
  end

  def joga
     print "Digite a jogada de " + @nome + ": "
     jogada = gets.split
  end
end

