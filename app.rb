require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/doctor')
require('./lib/patient')
require('pg')

DB = PG.connect({:dbname => "doctors_office"})

get('/') do
 @doctors = Doctor.all()
 erb(:index)
end

get('/doctors/:id') do
  @doctor = Doctor.find(params.fetch("id").to_i())
erb(:doctors)
end

post('/doctors') do
  name = params.fetch("doctor")
  specialty = params.fetch("specialty")
  doctor = Doctor.new({:name => name, :specialty => specialty, :id => nil})
  doctor.save()
  @doctors = Doctor.all()
  erb(:index)
end

post('/patients') do
  name = params.fetch("patient_name")
  birthday = params.fetch("birthday")
  doctor_id = params.fetch("doctor_id")
  patient = Patient.new({:name => name, :birthday => birthday, :doctor_id => doctor_id, :id => nil})
  patient.save()
  @doctor = Doctor.find(doctor_id)
  erb(:doctors)
end
