require_relative ‘bike’

class DockingStation

  attr_reader :bike
  def release_bike #assuming dock is empty
    fail ’Sorry mate, don\‘t be a dock’ unless @bike
    @bike
  end

  def dock(bike)
    @bike = bike
  end
  
end