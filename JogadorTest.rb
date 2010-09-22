require 'test/unit'
require 'Jogador'

class JogadorTest < Test::Unit::TestCase


  def test_new
     jogador = Jogador.new("Adolfo")
     assert_not_nil jogador
     assert_equal ("Adolfo", jogador.nome)
  end


end
