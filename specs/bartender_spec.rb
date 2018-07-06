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

  def test_call_manager
    expected = "I will go get the manager. Ben will be with you in a second."
    actual = @bartender_john.call_manager(@manager_ben)
    assert_equal(expected, actual)
  end


end
