require_relative("manager")
class Bartender

  attr_reader :name
  def initialize name
    @name = name
  end

  def call_manager manager
    return "I will go get the manager. #{manager.name} will be with you in a second."
  end



end
