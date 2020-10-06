require('spec_helper')

describe '#Patient' do

  describe('#==') do
    it("is the same patient if it has the same attributes as another patient") do
      patient = Patient.new({:name => "Naima", :doctor_id => @doctor.id, :id => nil})
      patient2 = Patient.new({:name => "Naima", :doctor_id => @doctor.id, :id => nil})
      expect(patient).to(eq(patient2))
    end
  end

  describe('.all') do
    it("returns a list of all patients") do
      patient = Patient.new({:name => "Giant Steps", :doctor_id => @doctor.id, :id => nil})
      patient.save()
      patient2 = Patient.new({:name => "Naima", :doctor_id => @doctor.id, :id => nil})
      patient2.save()
      expect(Patient.all).to(eq([patient, patient2]))
    end
  end

  describe('.clear') do
    it("clears all patients") do
      patient = Patient.new({:name => "Giant Steps", :doctor_id => @doctor.id, :id => nil})
      patient.save()
      patient2 = Patient.new({:name => "Naima", :doctor_id => @doctor.id, :id => nil})
      patient2.save()
      Patient.clear()
      expect(Patient.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a patient") do
      patient = Patient.new({:name => "Naima", :doctor_id => @doctor.id, :id => nil})
      patient.save()
      expect(Patient.all).to(eq([patient]))
    end
  end

  describe('.find') do
    it("finds a patient by id") do
      patient = Patient.new({:name => "Giant Steps", :doctor_id => @doctor.id, :id => nil})
      patient.save()
      patient2 = Patient.new({:name => "Naima", :doctor_id => @doctor.id, :id => nil})
      patient2.save()
      expect(Patient.find(patient.id)).to(eq(patient))
    end
  end

  describe('#update') do
    it("updates an patient by id") do
      patient = Patient.new({:name => "Naima", :doctor_id => @doctor.id, :id => nil})
      patient.save()
      patient.update("Mr. P.C.", @doctor.id)
      expect(patient.name).to(eq("Mr. P.C."))
    end
  end

  describe('#delete') do
    it("deletes an patient by id") do
      patient = Patient.new({:name => "Giant Steps", :doctor_id => @doctor.id, :id => nil})
      patient.save()
      patient2 = Patient.new({:name => "Naima", :doctor_id => @doctor.id, :id => nil})
      patient2.save()
      patient.delete()
      expect(Patient.all).to(eq([patient2]))
    end
  end

  describe('.find_by_doctor') do
    it("finds patients for an doctor") do
      doctor2 = Doctor.new({:name => "Blue", :id => nil})
      doctor2.save
      patient = Patient.new({:name => "Naima", :doctor_id => @doctor.id, :id => nil})
      patient.save()
      patient2 = Patient.new({:name => "California", :doctor_id => doctor2.id , :id => nil})
      patient2.save()
      expect(Patient.find_by_doctor(doctor2.id)).to(eq([patient2]))
    end
  end

  describe('#doctor') do
    it("finds the doctor a patient belongs to") do
      patient = Patient.new({:name => "Naima", :doctor_id => @doctor.id, :id => nil})
      patient.save()
      expect(patient.doctor()).to(eq(@doctor))
    end
  end
end
