require("minitest/autorun")
require_relative("../room")

class TestRoom < MiniTest::Test

  def setup
    @pop_room = Room.new("pop", 7, 10)
    @rock_room = Room.new("goth", 2, 15)
    @guest_mike = Guest.new("Mike", 100, "Cry me a river", "male")
    @guest_beata = Guest.new("Beata", 30, "Simply the best", "male")
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

  def test_how_many_reservations
    expected = 0
    actual = @pop_room.count_reservations
    assert_equal(expected, actual)
  end

  def test_check_if_seats_available__true
    expected = true
    actual = @pop_room.available_seats?
    assert_equal(expected, actual)
  end

  def test_check_if_seats_available__false
    @rock_room.check_in(@guest_mike)
    @rock_room.check_in(@guest_beata)
    expected = false
    actual = @rock_room.available_seats?
    assert_equal(expected, actual)
  end

  def test_check_out
    @pop_room.check_in(@guest_mike)
    @pop_room.check_out(@guest_mike)
    expected = 0
    actual = @pop_room.reservations.length
    assert_equal(expected, actual)
  end
end
