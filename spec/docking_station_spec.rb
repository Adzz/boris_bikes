require 'docking_station'

describe DockingStation do
  # it 'returns a method called release_bike' do
  #  #  bike = DockingStation.new
  #   expect(DockingStation.new.release_bike).to eq true
  # end
  it 'responds to release_bike' do
    expect(subject).to respond_to :release_bike
  end


describe '#release_bike' do
  it 'releases a bike' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end
  it 'raises an error there are no bikes available' do
    expect{subject.release_bike}.to raise_error 'No bikes available'
  end
end



describe '#dock' do
  it 'raise error when full' do
  subject.dock(Bike.new)
  expect {DockingStation::DEFAULT_CAPACITY.times do
    subject.dock(Bike.new) end }.to raise_error 'Docking Station full'
  end
end


  it 'releases working bikes' do
    bike = Bike.new
    subject.dock(bike)
    new_bike = subject.release_bike
    expect(new_bike).to be_working
  end

 it "doesn't release a broken bikes" do
   bike = Bike.new
   bike.report!
   subject.dock(bike)
   expect{subject.release_bike}.to raise_error 'There are no working bikes!'
 end

it "doesn't releases a working bike instead of a brokenn when available" do
  bike = Bike.new
  subject.dock(bike)
  bike_2 = Bike.new
  bike_2.report!
  subject.dock(bike_2)
  expect(subject.release_bike.working?).to eq true
end


  it 'docks something' do
    bike = Bike.new
    expect(subject.dock(bike)).to eq [bike]
  end

  it 'tells which bikes are docked' do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.bikes).to eq [bike]
  end

  it "Has a default capacity of DEFAULT_CAPACITY" do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end



  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

  it { is_expected.to respond_to(:capacity) }

end
