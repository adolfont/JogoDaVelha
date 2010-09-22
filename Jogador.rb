class Jogador

  def initialize( nome, simbolo )
    @nome = nome
    @simbolo = simbolo
  end

  def nome
    @nome
  end

  def simbolo
    @simbolo
  end

  def joga
     print "Digite a jogada \n(um par 'x y' com x e y entre 1 e 3) de " + @nome + ": "
     jogada = gets.split
  end
end

