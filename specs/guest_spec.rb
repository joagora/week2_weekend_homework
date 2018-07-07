require("minitest/autorun")
require_relative("../guest")

class Test_Guest < MiniTest::Test

  def setup
    @guest_mike = Guest.new("Mike", 30, "Cry me a river", "male", 100)
    @pop_room = Room.new("pop", 7, 10)
    lyrics = "I am the passenger
    And I ride and I ride
    I ride through the city's backsides
    I see the stars come out of the sky
    Yeah, they're bright in a hollow sky
    You know it looks so good tonight..."
    @song1 = Song.new("Passenger", lyrics, "Iggy Pop")
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

  def test_request_song
    @pop_room.add_song(@song1)
    expected = "Tudumdum Tudumdum I am the passenger
    And I ride and I ride
    I ride through the city's backsides
    I see the stars come out of the sky
    Yeah, they're bright in a hollow sky
    You know it looks so good tonight..."
    actual = @guest_mike.request_song("Passenger", @pop_room)
    assert_equal(expected, actual)
  end

end
