require("minitest/autorun")
require_relative("../guest")

class Test_Guest < MiniTest::Test

  def setup
    @guest_mike = Guest.new("Mike", 30, "Cry me a river", "male", 100)
    @pop_room = Room.new("pop", 7, 10)
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

  def test_pay_entry_fee__less_money
    expected = 90
    @guest_mike.pay_fee(@pop_room)
    actual = @guest_mike.wallet
    assert_equal(expected, actual)
  end

end
