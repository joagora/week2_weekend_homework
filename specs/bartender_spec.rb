require("minitest/autorun")
require_relative("../bartender")

class TestBartender < MiniTest::Test

  def setup
    @bartender_john = Bartender.new("John")
    @manager_ben = Manager.new("Ben")
  end

  def test_name
    expected = "John"
    actual = @bartender_john.name
    assert_equal(expected, actual)
  end



end
