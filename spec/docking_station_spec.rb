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
  expect {20.times do subject.dock(Bike.new) end }.to raise_error 'Docking Station full'
  end
end

  it 'releases working bikes' do
    bike = Bike.new
    #bike = subject.release_bike
    expect(bike).to be_working
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

  it { is_expected.to respond_to(:dock).with(1).argument }

  it { is_expected.to respond_to(:bikes) }

end
