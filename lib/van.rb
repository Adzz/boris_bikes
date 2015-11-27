
class Van

def initialize
    @bikes=[]
end

attr_reader :bikes



def collect(station, garage)
 array = bikes << station.bikes.select{|bike| !(bike.working?)}
 array.flatten!
end


def deposit(station, garage)

end

end
