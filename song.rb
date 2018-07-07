class Song

  attr_reader :title, :lyrics, :artist
  def initialize title, lyrics, artist
    @title = title
    @lyrics = lyrics
    @artist = artist
  end

  def play
    return "Tudumdum Tudumdum #{lyrics}"
  end
  
end
