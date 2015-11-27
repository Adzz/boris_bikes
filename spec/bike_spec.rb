require 'bike'

describe Bike do
    it { is_expected.to respond_to :working?}
    it { is_expected.to respond_to :report!}
    it "makes working? false" do
      subject.report!
      expect(subject.working?).to eq false
    end
    it "works by default" do
      expect(subject.working?).to eq true
    end
end
