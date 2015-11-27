class Bike

def initialize
  @working = true
end

def fix!
  @working = true
  self
end

def report!
  @working = false
  self
end

  def working?
    @working
  end

end
