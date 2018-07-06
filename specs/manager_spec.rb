require("minitest/autorun")
require_relative("../manager")

class TestManager < MiniTest::Test

  def setup
    @manager_ben = Manager.new("Ben")
    @guest_mike = Guest.new("Mike", 100, "Cry me a river", "male")
    @guest_vicky = Guest.new("Vicky", 10, "Magic dance", "female")
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

  def test_ask_to_leave__male
    expected = "Sir, I am gonna have to ask you to leave."
    actual = @manager_ben.ask_to_leave(@guest_mike)
    assert_equal(expected, actual)
  end

  def test_ask_to_leave__female
    expected = "Ma'am, I am gonna have to ask you to leave."
    actual = @manager_ben.ask_to_leave(@guest_vicky)
    assert_equal(expected, actual)
  end

end
