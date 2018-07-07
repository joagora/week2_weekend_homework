require_relative("guest")

class Room

  attr_reader :music_type, :seats, :entry_fee, :reservations
  def initialize music_type, seats, entry_fee
    @music_type = music_type
    @seats = seats
    @entry_fee = entry_fee
    @reservations = []
  end

  def check_in guest
    @reservations << guest
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



end
