require_relative "app/models/patient.rb"
require_relative "app/models/room.rb"
require_relative "app/repositories/patient_repository.rb"

# steven = Patient.new(name: "Steven", cured: false)
# michael = Patient.new(name: "Michael", cured: false)


# steven.cure!
# p steven.cured?

# p steven.name

# vip_room = Room.new(capacity: 2)

# vip_room.add_patient(steven)
# vip_room.add_patient(michael)
# vip_room.add_patient(jon)

# p vip_room.full?
# p vip_room

# instance of a room
# p michael.room.patients
# p vip_room.patients

csv_file = "data/patients.csv"

p patient_repo = PatientRepository.new(csv_file)

jon = Patient.new(name: "Jon")

patient_repo.create(jon)

p patient_repo