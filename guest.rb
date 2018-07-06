class Guest

  attr_reader :name, :wallet, :favourite_song, :gender
  def initialize name, wallet, favourite_song, gender
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
    @gender = gender
  end

end
