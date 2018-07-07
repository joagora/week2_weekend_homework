require("minitest/autorun")
require_relative("../guest")

class Test_Guest < MiniTest::Test

  def setup
    @guest_mike = Guest.new("Mike", 100, "Cry me a river", "male")
  end

  def test_name
    expected = "Mike"
    actual = @guest_mike.name
    assert_equal(expected, actual)
  end

  def test_gender
    expected = "male"
    actual = @guest_mike.gender
    assert_equal(expected, actual)
  end

end
