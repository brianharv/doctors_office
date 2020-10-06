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


# get for /doctors
get('/docto')
# get for /doctors/:id
# post for /doctors
# patch for /doctors/:id
# delete for /doctors/:id

# get for /doctors/:id/patients/:patient_id
# post for /doctors/:id/patients
# patch for /doctors/:id/patients/:patient_id
# delete for /doctors/:id/patients/:patient_id


# ? get /doctors/new -- takes us to the form for adding a doctor??