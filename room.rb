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

end
