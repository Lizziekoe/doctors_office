class Doctor
  attr_reader(:name, :specialty, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @specialty = attributes.fetch(:specialty)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    returned_doctors = DB.exec("SELECT * FROM doctors;")
      doctors = []
    returned_doctors.each() do |doctor|
      name = doctor.fetch("name")
      specialty = doctor.fetch("specialty")
      id = doctor.fetch("id").to_i()
      doctors.push(Doctor.new({:name => name, :specialty => specialty, :id => id}))
  end
    doctors
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO doctors (name, specialty) VALUES ('#{@name}', '#{@specialty}') RETURNING id;")
    @id = result.first().fetch("id").to_i()
  end

  define_singleton_method(:find) do |id|
    found_doctor = nil
    Doctor.all().each() do |doctor|
      if doctor.id().==(id)
        found_doctor = doctor
      end
    end
    found_doctor
  end

  define_method(:patients) do
    doctors_patients = []
    patients = DB.exec("SELECT * FROM patients WHERE doctor_id = #{self.id()} ORDER BY name;")
    patients.each() do |patient|
      name = patient.fetch("name")
      doctor_id = patient.fetch("doctor_id").to_i()
      birthday = patient.fetch("birthday")
      doctors_patients.push(Patient.new(:name => name, :doctor_id => doctor_id, :birthday => birthday, :id => nil))
    end
    doctors_patients
  end

  define_method(:==) do |another_doctor|
    self.name().==(another_doctor.name()).&(self.id().==(another_doctor.id()))
  end
end
