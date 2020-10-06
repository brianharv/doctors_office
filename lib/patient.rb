# patient will have name, birthdate, doctor id
class Patient
  attr_reader: :id 
  attr_accessor: :name , :doctor_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @doctor_id = attributes.fetch(:id)
  end

  def ==(patient_to_compare)
    (self.name() == patient_to_compare.name()) && (self.album_id() == patient_to_compare.album_id())
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patients|
      name = patients.fetch("name")
      album_id = patients.fetch("album_id").to_i
      id = patients.fetch("id").to_i
      patients.push(Song.new({:name => name, :album_id => album_id, :id => id}))
    end
    patients
  end



