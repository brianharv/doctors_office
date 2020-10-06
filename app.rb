require('sinatra')
require('sinatra/reloader')
require('./lib/doctor')
require('./lib/patient')
require('pry')
require('pg')
also_reload('lib/**/*.rb')

DB = PG.connect({:dbname => "doctors_office"})

get('/') do
  redirect to('/doctors')
end


get('/doctors') do
  @doctors = Doctor.all 
  erb(:doctors)
end

get('/doctors/:id')
  @doctors = Doctor.find(params[:id].to_i)
  erb(:doctor)
end

get('/doctors/new') do
  erb(:new_doctor)
end

post('/doctors') do
  name = params[:name]
  doctor = Doctor.new({:name => name, :id => nil})
  doctor.save()
  redirect to('/doctors')
end

patch('/doctors/:id') do
  @doctor = Doctor.find(params[:id].to_i)
  @doctor.update(param[:name])
  redirect to('/doctors')
end

delete('/doctors/:id') do
  @doctor = Doctor.find(params[:id].to_i)
  @doctor.delete()
  redirect to('/doctors')
end
  
### PATIENTS ###

get('/doctors/:id/patients/:patient_id') do
  @patient = Patient.find(params[:patient_id].to_i())
  erb(:song)
end

# post for /doctors/:id/patients
post ('/doctors/:id/patients') do
  @doctor = Doctor.find(params[:id].to_i())
  patient = Patient.new({:name => params[:patient_name], :doctor_id => @doctor.id, :id => nil})
  patient.save()
  erb(:doctor)
end
# patch for /doctors/:id/patients/:patient_id
patch ('/doctors/:id/patients/:patient_id') do
  @doctor = Doctor.find(params[:id].to_i())
  patient = Patient.find(params[:patient_id].to_i())
  patient.update(params[:name], @doctor.id)
  erb(:doctor)
end
# delete for /doctors/:id/patients/:patient_id
delete ('/doctors/:id/patients/:patient_id') do
  patient = Patient.find(params[:patient_id].to_i())
  patient.delete
  @doctor = Doctor.find(params[:id].to_i())
  erb(:doctor)
end


# ? get /doctors/new -- takes us to the form for adding a doctor??