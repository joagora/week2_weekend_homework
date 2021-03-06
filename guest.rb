require_relative("room")
class Guest

  attr_reader :name, :wallet, :favourite_song, :gender, :age
  def initialize name, age, favourite_song, gender, wallet
    @name = name
    @wallet = wallet
    @favourite_song = favourite_song
    @gender = gender
  end

  def pay_fee room
    @wallet -= room.entry_fee
    room.add_to_till(room.entry_fee)
  end

  def request_song title, room
    played_song = room.play_song_by_title(title)

    if title == @favourite_song
      return "#{cheer} #{played_song}"
    else
      return played_song
    end
  end

  def cheer
    return "Whooooo"
  end
end
