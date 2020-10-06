# patient will have name, birthdate, doctor id
class Patient
  attr_reader: :id 
  attr_accessor: :name , :doctor_id

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @doctor_id = attributes.fetch(:doctor_id)
  end

  def ==(patient_to_compare)
    if patient_to_compare != nil
      ((self.name() == patient_to_compare.name()) && (self.id() == patient_to_compare.id()) && ((self.doctor_id() == patient_to_compare.doctor_id))
    else
      false
    end  
  end

  def self.all
    returned_patients = DB.exec("SELECT * FROM patients;")
    patients = []
    returned_patients.each() do |patients|
      name = patients.fetch("name")
      doctor_id = patients.fetch("doctor_id").to_i
      id = patients.fetch("id").to_i
      patients.push(Patient.new({:name => name, :doctor_id => doctor_id, :id => id}))
    end
    patients
  end
def save
    result = DB.exec("INSERT INTO patients (name, doctor_id) VALUES ('#{@name}', #{@doctor_id}) RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  def self.find(id)
    patient = DB.exec("SELECT * FROM patients WHERE id = #{id};").first
    name = patient.fetch("name")
    doctor_id = patient.fetch("doctor_id").to_i
    id = patient.fetch("id").to_i
    Patient.new({:name => name, :doctor_id => doctor_id, :id => id})
  end

  def update(name, doctor_id)
    @name = name
    @doctor_id = doctor_id
    DB.exec("UPDATE patients SET name = '#{@name}', doctor_id = #{@doctor_id} WHERE id = #{@id};")
  end

  def delete
    DB.exec("DELETE FROM patients WHERE id = #{@id};")
  end

  def self.clear
    DB.exec("DELETE FROM patients *;")
  end

  def self.find_by_doctor(doc_id)
    patients = []
    returned_patients = DB.exec("SELECT * FROM patients WHERE doctor_id = #{doc_id};")
    returned_patients.each() do |patient|
      name = patient.fetch("name")
      id = patient.fetch("id").to_i
      patients.push(Patient.new({:name => name, :doctor_id => doc_id, :id => id}))
    end
    patients
  end

  def doctor
    Doctor.find(@doctor_id)
  end
end

