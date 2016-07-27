require ("minitest/autorun")
require ("minitest/rg")
require_relative ("../mastermind_game")

class TestMaster < Minitest::Test
  def setup
    @game = Master.new("Leek")
  end

  def test_can_get_turn
    assert_equal(0, @game.turn_counter)
  end

  def test_can_get_name
    assert_equal("Leek",@game.player[:name])
  end

  def test_make_master_solution
    @game.summon_the_master()
    assert_equal(["B","Y","G","R"], @game.solution)
  end

  def test_translate_guess
    input = @game.translate_guess("b y g r")
    assert_equal(["B","Y","G","R"], input)
  end

  def test_compare
    @game.summon_the_master()
    red1, white1 = @game.compare(["B","Y","R","G"])
    red2, white2 = @game.compare(["Y","Y","Y","Y"])
    assert_equal(2,red1)
    assert_equal(2,white1)
    assert_equal(1,red2)
    assert_equal(0,white2)

  end
end