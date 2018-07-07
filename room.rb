require('pry')
require_relative("guest")
require_relative("song")

class Room

  attr_reader :music_type, :seats, :entry_fee, :reservations, :song_list, :till
  def initialize music_type, seats, entry_fee
    @music_type = music_type
    @seats = seats
    @entry_fee = entry_fee
    @reservations = []
    @song_list = []
    @till = 0
  end

  def add_to_reservations guest
    @reservations.push(guest)

  end

  def check_in guest
    if (available_seats? == true) && (check_if_can_afford(guest) == true)
      add_to_reservations(guest)
    else
      return "No seats available"
    end
  end

  def check_out guest
    @reservations.delete(guest)
  end

  def count_reservations
    @reservations.length
  end

  def available_seats?
    if @seats > count_reservations
      return true
    else
      return false
    end
  end

  def add_song song
    @song_list << song
  end

  def add_to_till amount
    @till += amount
  end

  def refuse_check_in
      return "No seats available"
  end

  def check_if_can_afford guest
    if guest.wallet >= @entry_fee
      return true
    else
      return false
    end
  end
end
