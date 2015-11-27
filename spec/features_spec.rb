require 'garage'
require 'docking_station'
require 'bike'


describe "Features" do

  describe "#garage"
    it "Removes the broken bike(s) from Docking Station that are collected." do
      station = DockingStation.new
      garage = Garage.new
      broken = Bike.new.report!
      station.dock(broken)
      3.times { station.dock(Bike.new)}
      garage.collect(station)
      expect(station.bikes.length).to eq 3
    end

    it "Doesn't remove working bikes" do
      station = DockingStation.new
      garage=Garage.new
      3.times {station.dock(Bike.new)}
      garage.collect(station)
      expect(station.bikes.length).to eq 3
    end

    it "Removes ALL broken bikes" do
      station = DockingStation.new
      garage = Garage.new
      3.times {station.dock(Bike.new.report!)}
      garage.collect(station)
      expect(station.bikes.length).to eq 0
    end

    describe "#garage"


      it "Only deposits working Bikes" do
        station = DockingStation.new
        garage = Garage.new
        3.times {station.dock(Bike.new.report!)}
        3.times {station.dock(Bike.new)}
        garage.collect(station)
        garage.deposit(station)
        expect(station.bikes.all? {|bike| bike.working?}).to eq true
      end

      it "deposits something" do
        station = DockingStation.new
        garage = Garage.new
        3.times {station.dock(Bike.new.report!)}
        3.times {station.dock(Bike.new)}
        garage.collect(station)
        garage.deposit(station)
        expect(station.bikes.length).to eq 6
      end



end
