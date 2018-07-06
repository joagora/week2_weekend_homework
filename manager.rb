require_relative("guest")

class Manager

  attr_reader :name
  def initialize(name)
    @name = name
  end

  def introduce
    return "Hello, my name is #{@name}, I am one of the managers this evening."
  end

  def ask_to_leave guest
    address = nil
    if guest.gender == "male"
      address = "Sir"
    else
      address = "Ma'am"
    end
    return "#{address}, I am gonna have to ask you to leave."
  end
end
