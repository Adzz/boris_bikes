require "garage"

describe Garage do
let (:station) { double :station}
let (:working_bike) { double :bike, working?: true}
let (:broken_bike) { double :bike, working?: false, fix!: working_bike}


  describe "#collect" do
    it { is_expected.to respond_to(:collect).with(1).argument }

    it "Only collects broken bikes" do
      allow(station).to receive(:bikes) {[broken_bike, working_bike]}
      subject.collect(station)
      expect(subject.bikes).to eq [broken_bike]
    end

    it "Collects Just the broken bikes into the van" do
      allow(station).to receive(:bikes) {[broken_bike, working_bike, broken_bike, broken_bike]}
      subject.collect(station)
      expect(subject.bikes).to eq([broken_bike, broken_bike, broken_bike])
    end

end


  describe "#deposit" do
    it { is_expected.to respond_to(:deposit).with(1).argument }


    it "deposits all bikes" do
      allow(station).to receive(:bikes) {[broken_bike, broken_bike, broken_bike]}
      allow(station).to receive(:dock)
      subject.collect(station)
      subject.deposit(station)
      expect(subject.bikes.empty?).to eq true
    end


end










end
