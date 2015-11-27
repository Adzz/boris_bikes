require_relative 'bike'

class DockingStation

DEFAULT_CAPACITY = 20

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

attr_reader :bikes
attr_reader :capacity

  def release_bike
   fail 'No bikes available' if empty?
   fail 'There are no working bikes!' unless any_working?
   bikes.sort!{|a, b| a.working?.to_s <=> b.working?.to_s}
   bikes.pop
  end


def any_working?
  bikes.map{|bike|
    bike.working?
  }.include?(true)
end

  def dock(bike)
   fail 'Docking Station full' if full?
    bikes << bike
  end

private

 def full?
   if bikes.length >= capacity
   return true
 else
   return false
 end
 end

 def empty?
   bikes.empty?
 end



end
