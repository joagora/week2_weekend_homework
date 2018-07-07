require("minitest/autorun")
require_relative("../room")

class TestRoom < MiniTest::Test

  def setup
    @pop_room = Room.new("pop", 7, 10)
    @guest_mike = Guest.new("Mike", 100, "Cry me a river", "male")
  end

  def test_music_type
    expected = "pop"
    actual = @pop_room.music_type
    assert_equal(expected, actual)
  end

  def test_seats
    expected = 7
    actual = @pop_room.seats
    assert_equal(expected, actual)
  end

  def test_entry_fee
    expected = 10
    actual = @pop_room.entry_fee
    assert_equal(expected, actual)
  end

  def test_check_in
    @pop_room.check_in(@guest_mike)
    expected = 1
    actual = @pop_room.reservations.length
    assert_equal(expected, actual)
  end

end
