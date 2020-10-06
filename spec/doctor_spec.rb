require 'spec_helper'

describe '#Doctor' do


  describe('.all') do
    it("returns an empty array when there are no doctors") do
      expect(Doctor.all).to(eq([]))
    end
  end

  describe('#save') do
    it("saves a doctor") do
      doctor = Doctor.new({:name => "Steve Brule", :id => nil})
      doctor.save()
      doctor2 = Doctor.new({:name => "Todd Grande", :id => nil})
      doctor2.save()
      expect(Doctor.all).to(eq([doctor, doctor2]))
    end
  end

  describe('.clear') do
    it("clears all doctors") do
      doctor = Doctor.new({:name => "Steve Brule", :id => nil})
      doctor.save()
      doctor2 = Doctor.new({:name => "Todd Grande", :id => nil})
      doctor2.save()
      Doctor.clear
      expect(Doctor.all).to(eq([]))
    end
  end

  describe('#==') do
    it("is the same doctor if it has the same attributes as another doctor") do
      doctor = Doctor.new({:name => "Todd Grande", :id => nil})
      doctor2 = Doctor.new({:name => "Todd Grande", :id => nil})
      expect(doctor).to(eq(doctor2))
    end
  end

  describe('.find') do
    it("finds an doctor by id") do
      doctor = Doctor.new({:name => "Steve Brule", :id => nil})
      doctor.save()
      doctor2 = Doctor.new({:name => "Todd Grande", :id => nil})
      doctor2.save()
      expect(Doctor.find(doctor.id)).to(eq(doctor))
    end
  end

  describe('#update') do
    it("updates an doctor by id") do
      doctor = Doctor.new({:name => "Steve Brule", :id => nil})
      doctor.save()
      doctor.update("Steve Brule")
      expect(doctor.name).to(eq("Steve Brule"))
    end
  end

  describe('#delete') do
    it("deletes an doctor by id") do
      doctor = Doctor.new({:name => "Steve Brule", :id => nil})
      doctor.save()
      doctor2 = Doctor.new({:name => "Todd Grande", :id => nil})
      doctor2.save()
      doctor.delete()
      expect(Doctor.all).to(eq([doctor2]))
    end
  end

  describe('#patients') do
    it("returns an doctor's patients") do
      doctor = Doctor.new({:name => "Steve Brule", :id => nil})
      doctor.save()
      patient = Patient.new({:name => "Carly Simon", :doctor_id => doctor.id, :id => nil, :birthdate => '1948-02-01'})
      patient.save()
      patient2 = Patient.new({:name => "Cousin Mary", :doctor_id => doctor.id, :id => nil, :birthdate => '1950-04-03'})
      patient2.save()
      expect(doctor.patients).to(eq([patient, patient2]))
    end
  end
end