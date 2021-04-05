require_relative 'bike'

class DockingStation 
  DEFAULT_CAPACITY = 20
  attr_accessor :capacity

  def initialize(capacity=DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def release_bike
    fail 'No bikes available' if working_bikes.empty?
    bikes.delete(working_bikes.pop)
  end

  def dock(bike)
    fail 'Dock off im stuffed' if full?
    bikes << bike
  end

  private

  attr_accessor :bikes

  def empty?
    bikes.empty?
  end

  def full?
    bikes.length >= capacity
  end

  def report_broken
    @broken = true
  end

  def working_bikes
    bikes.reject { |bike| bike.broken? }
  end

end