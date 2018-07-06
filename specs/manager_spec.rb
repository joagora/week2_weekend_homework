require("minitest/autorun")
require_relative("../manager")

class TestManager < MiniTest::Test

  def setup
    @manager_ben = Manager.new("Ben")
  end

  def test_name
    expected = "Ben"
    actual = @manager_ben.name
    assert_equal(expected, actual)
  end
end
