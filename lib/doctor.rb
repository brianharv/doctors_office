class Doctor
  attr_reader :id
  attr_accessor :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def ==(doctor_to_compare)
    if doctor_to_compare != nil
      (self.name() == doctor_to_compare.name()) && (self.id() == doctor_to_compare.id())
    else
      false
    end  
  end
  
  def self.all
    returned_doctors = DB.exec("SELECT * FROM doctors;")
    doctors = []
    returned_doctors.each() do |doctor|
      name = attributes.fetch("name")
      id = attributes.fetch("id").to_i
      doctors.push(Doctor.new({:name => name, :id => id}))
    end
    doctors
  end   

  def self.clear
    DB.exec("DELETE FROM doctors *;")
  end
  
  def save
    result = DB.exec("INSERT INTO doctors (name) VALUES ('#{@name}' RETURNING id;")
    @id = result.first().fetch("id").to_i
  end
  
  def self.find(id)
    doctor  DB.exec("SELECT * FROM doctors WHERE id =#{id};").first
    name = doctor.fetch("name")
    id = doctors.fetch("id").to_i
    Doctor.new({:name => name, :id => id})
  end
  
  def update(name)
    @name = name
    DB.exec("UPDATE doctors SET name = '#{@name}' WHERE id = #{@id};")
  end
  
  def delete
    DB.exec("DELETE FROM doctors WHERE id = #{@id};")
    DB.exec("DELETE FROM patients WHERE doctor_id = #{@id};")
  end

  def patient
    Patient.find_by_doctor(self.id)
  end  
end    