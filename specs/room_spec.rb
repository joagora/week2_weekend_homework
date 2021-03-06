require("minitest/autorun")
require_relative("../room")

class TestRoom < MiniTest::Test

  def setup
    @pop_room = Room.new("pop", 7, 10)
    @rock_room = Room.new("rock", 2, 15)
    @guest_mike = Guest.new("Mike", 30, "Cry me a river", "male", 100)
    @guest_beata = Guest.new("Beata", 30, "Simply the best", "female", 10)
    @guest_john = Guest.new("John", 30, "We are the champions", "male", 19)
    @guest_joanna = Guest.new("Joanna", 27, "Doing it to death", "female", 30)

    lyrics = "I am the passenger
    And I ride and I ride
    I ride through the city's backsides
    I see the stars come out of the sky
    Yeah, they're bright in a hollow sky
    You know it looks so good tonight..."
    @song1 = Song.new("Passenger", lyrics, "Iggy Pop")
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

  def test_check_in__available_seats
    @pop_room.check_in(@guest_mike)
    expected = 1
    actual = @pop_room.reservations.length
    assert_equal(expected, actual)
  end

  def test_check_in__no_available_seats
    @rock_room.check_in(@guest_mike)
    @rock_room.check_in(@guest_beata)
    @rock_room.check_in(@guest_joanna)
    expected = 2
    actual = @rock_room.reservations.length
    assert_equal(expected, actual)
  end

  def test_check_in__no_available_seats_refused
    @rock_room.check_in(@guest_mike)
    @rock_room.check_in(@guest_john)
    expected = "No seats available"
    actual = @rock_room.check_in(@guest_joanna)
    assert_equal(expected, actual)
  end

  def test_add_guest_to_reservations
    @rock_room.add_to_reservations(@guest_mike)
    @rock_room.add_to_reservations(@guest_beata)

    expected = 2
    actual = @rock_room.count_reservations
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
    @rock_room.add_to_reservations(@guest_mike)
    @rock_room.add_to_reservations(@guest_beata)
    expected = false
    actual = @rock_room.available_seats?
    assert_equal(expected, actual)
  end

  def test_check_out
    @pop_room.add_to_reservations(@guest_mike)
    @pop_room.check_out(@guest_mike)
    expected = 0
    actual = @pop_room.reservations.length
    assert_equal(expected, actual)
  end

  def test_add_song
    @pop_room.add_song(@song1)
    expected = 1
    actual = @pop_room.song_list.length
    assert_equal(expected, actual)
  end

  def test_add_to_till
    expected = 100
    actual = @pop_room.add_to_till(100)
    assert_equal(expected, actual)
  end

  def test_refuse_check_in
    @rock_room.add_to_reservations(@guest_mike)
    @rock_room.add_to_reservations(@guest_beata)
    expected = "No seats available"
    actual = @rock_room.refuse_check_in
    assert_equal(expected, actual)
  end

  def test_guest_can_afford_entry
    expected = true
    actual = @pop_room.check_if_can_afford(@guest_mike)
    assert_equal(expected, actual)
  end

  def test_guest_can_afford_entry__false
    expected = false
    actual = @rock_room.check_if_can_afford(@guest_beata)
    assert_equal(expected, actual)
  end

  def test_find_song_by_title
    @rock_room.add_song(@song1)
    expected = @song1
    actual = @rock_room.find_song_by_title("Passenger")
    assert_equal(expected, actual)
  end

  def test_play_song_by_title
    @rock_room.add_song(@song1)
    expected = "Tudumdum Tudumdum I am the passenger
    And I ride and I ride
    I ride through the city's backsides
    I see the stars come out of the sky
    Yeah, they're bright in a hollow sky
    You know it looks so good tonight..."
    actual = @rock_room.play_song_by_title("Passenger")
    assert_equal(expected, actual)
  end
end
