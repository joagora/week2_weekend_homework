require("minitest/autorun")
require_relative("../manager")

class TestManager < MiniTest::Test

  def setup
    @manager_ben = Manager.new("Ben")
    @guest_mike = Guest.new("Mike", 100, "Cry me a river")
  end

  def test_name
    expected = "Ben"
    actual = @manager_ben.name
    assert_equal(expected, actual)
  end

  def test_introduce_himself
    expected = "Hello, my name is Ben, I am one of the managers this evening."
    actual = @manager_ben.introduce
    assert_equal(expected, actual)
  end

  def test_ask_to_leave
    expected = "Sir, I am gonna have to ask you to leave."
    actual = @manager_ben.ask_to_leave(@guest)
  end
end
