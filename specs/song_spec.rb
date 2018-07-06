require("minitest/autorun")
require_relative("../song")

class TestSong < MiniTest::Test

  def setup
    lyrics = "I am the passenger
    And I ride and I ride
    I ride through the city's backsides
    I see the stars come out of the sky
    Yeah, they're bright in a hollow sky
    You know it looks so good tonight..."
    @song1 = Song.new("Passenger", lyrics, "Iggy Pop")
  end

  def test_title
    expected = "Passenger"
    actual = @song1.title
    assert_equal(expected, actual)
  end

  def test_lyrics
    expected = "I am the passenger
    And I ride and I ride
    I ride through the city's backsides
    I see the stars come out of the sky
    Yeah, they're bright in a hollow sky
    You know it looks so good tonight..."
    actual = @song1.lyrics
    assert_equal(expected, actual)
  end

  def test_artist
    expected = "Iggy Pop"
    actual = @song1.artist
    assert_equal(expected, actual)
  end

  def test_play
    expected = "Tudumdum Tudumdum I am the passenger
    And I ride and I ride
    I ride through the city's backsides
    I see the stars come out of the sky
    Yeah, they're bright in a hollow sky
    You know it looks so good tonight..."
    actual = @song1.play
    assert_equal(expected, actual)
  end
end
