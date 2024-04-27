require "csv"

class PatientRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @next_id = 1
    # @room_repository = room_repository
    @patients = []
    load_csv if File.exists?(@csv_file_path)
  end

  def create(patient)
    patient.id = @next_id
    @next_id += 1
    @patients << patient
    save_csv
  end

  private

  def load_csv
    CSV.foreach(@csv_file_path, headers: :first_row, header_converters: :symbol) do |attributes|
      attributes[:id] = attributes[:id].to_i

                            # "false" == "true" => false
                            # "true" == "true" => true
      attributes[:cured] = attributes[:cured] == "true"
      id = attributes[:room_id].to_i # integer
      # hash create
      # attributes[:room] = @room_repository.find(id) # instance of a room
      @patients << Patient.new(attributes)
    end
    @next_id = @patients.empty? ? @next_id : @patients.last.id + 1
  end

  def save_csv
    CSV.open(@csv_file_path, "wb") do |csv|
      csv << ["id", "name", "cured"]
      @patients.each do |patient|
        csv << [patient.id, patient.name, patient.cured?]
      end
    end
  end
end
