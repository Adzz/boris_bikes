require "van"

describe Van do
let (:station) { double :station}
let (:garage) { double :garage}
let (:working_bike) { double :bike}
let (:broken_bike) { double :bike}


  describe "#collect" do
    it { is_expected.to respond_to(:collect).with(2).argument }

    it "only collects broken bikes" do
      allow(broken_bike).to receive(:working?) {false}
      allow(working_bike).to receive(:working?) {true}
      allow(station).to receive(:bikes) {[broken_bike, working_bike]}
      subject.collect(station, garage)
      expect(subject.bikes).to eq [broken_bike]
    end

    it "takes all broken bikes" do

    end


    it "doesn't take working bikes"do

    end

end


  describe "#deposit" do
    it { is_expected.to respond_to(:deposit).with(2).argument }

    it "deposits all broken bikes" do

    end


end










end
