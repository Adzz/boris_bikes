class Garage


def initialize
      @bikes=[]
end

attr_reader :bikes


def collect(station)
   @bikes += station.bikes.select{|bike| !(bike.working?)}
   station.bikes.select!{|bike| (bike.working?)}

end


def deposit(station)
  bikes.each {|bike|
    bike.fix!
    station.dock(bike)}
  @bikes = []
end



end
