require "docking_station"

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it { is_expected.to respond_to :dock }


describe '#release_bike' do


  it "it should release a bike" do
    bike = Bike.new
    subject.dock(bike)
    expect(subject.release_bike).to eq bike
  end

  it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error 'No bikes available'
  end

   it 'does not release broken bikes' do
    bike = Bike.new
    bike.report_broken
    subject.dock(bike)
    expect {subject.release_bike}.to raise_error 'No bikes available'
  end

  end

  describe '#dock' do

    it 'raises an error when full' do 
      subject.capacity.times { subject.dock Bike.new }
      bike = Bike.new
      expect { subject.dock Bike.new }.to raise_error 'Dock off im stuffed'
    end

  end

  it 'should have a default capacity' do
    expect(subject.capacity).to eq(DockingStation::DEFAULT_CAPACITY)
  end

  describe '#intitialize' do
    it 'intitializes with a given capacity' do
      def_cap = 50
      docking_station = DockingStation.new(50)
      expect(docking_station.capacity).to eq(def_cap)
    end
  end

  it 'allows user to set capacity' do
    expect(subject).to respond_to(:capacity)
  end

end

