require_relative 'bike'

class DockingStation 
  attr_reader :bikes

  def initialize
    @bikes = []
  end

  def release_bike #assuming dock is empty
    fail 'Sorry mate, don\'t be a dock' if @bikes.empty?
      @bikes.pop
  end

  def dock(bike)
    fail 'Dock off im stuffed' if full?
      @bikes << bike 
  end

  private
  def full?
    @bikes.length >= 20
  end


end