require("minitest/autorun")
require_relative("../guest")

class Test_Guest < MiniTest::Test

  def setup
    @guest_mike = Guest.new("Mike", 100, "Cry me a river" )
  end

  def test_name
    expected = "Mike"
    actual = @guest_mike.name
    assert_equal(expected, actual)
  end
end
