class Doctor
  attr_reader :id
  attr_accessor :name

  def initialize(attributes)
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  def ==(doctor_to_compare)
    (self.name() == doctor_to_compare.name()) && (self.id() == doctor_to_compare.id())
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
  
  