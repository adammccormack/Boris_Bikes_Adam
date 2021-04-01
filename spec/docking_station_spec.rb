require "docking_station"

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to :dock}


  it "it should release a bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end
    
  describe '#release_bike' do

    it 'raises an error when empty' do
      expect { subject.release_bike }.to raise_error 'Sorry mate, don\'t be a dock'
    end

  end

  describe '#dock' do

    it 'raises an error when full' do 
      DockingStation::DEFAULT_CAPACITY.times { subject.dock Bike.new }
      bike = Bike.new
      expect { subject.dock(bike) }.to raise_error 'Dock off im stuffed'
    end

  end

end

