class Manager

  attr_reader :name
  def initialize(name)
    @name = name
  end

  def introduce
    return "Hello, my name is #{@name}, I am one of the managers this evening."
  end
end
