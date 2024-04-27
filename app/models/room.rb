class Room
  attr_reader :patients
  attr_accessor :id

  class CapacityReachedError < StandardError; end

  def initialize(attributes = {})
    @id = attributes[:id] #integer
    @capacity = attributes[:capacity] || 0
    @patients = attributes[:patients] || [] # array of instances
  end

  def add_patient(patient)
    raise CapacityReachedError, "Room is full" if full?
    patient.room = self
    @patients << patient
  end

  def full?
    @patients.size >= @capacity
  end
end
