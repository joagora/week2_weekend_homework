class Guest

  attr_reader :name, :wallet, :favourite_song, :gender, :age
  def initialize name, age, favourite_song, gender, wallet
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
    @gender = gender
  end

end
