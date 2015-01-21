require('spec_helper')
require('pry')

describe(Doctor) do
  describe("#name") do
    it("puts out the name of the doctor") do
      doctor = Doctor.new({:name => "Jackie", :specialty => "feet", :id => nil})
      expect(doctor.name()).to(eq("Jackie"))
    end
  end

  describe("#specialty") do
    it("puts out the name of the doctor") do
      doctor = Doctor.new({:name => "Jackie", :specialty => "feet", :id => nil})
      expect(doctor.specialty()).to(eq("feet"))
    end
  end

  describe("#id") do
    it("puts out the name of the doctor") do
      doctor = Doctor.new({:name => "Jackie", :specialty => "feet", :id => nil})
      doctor.save()
      expect(doctor.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("saves the doctor info to the database") do
      doctor = Doctor.new({:name => "Jackie", :specialty => "feet", :id => nil})
      doctor.save()
      expect(Doctor.all()).to(eq([doctor]))
    end
  end

  describe(".all") do
    it("it starts with no doctors") do
      expect(Doctor.all()).to(eq([]))
    end
  end

  describe(".find") do
    it("returns a doctor by its ID number") do
      test_doctor = Doctor.new({:name => "Jackie", :specialty => "feet", :id => nil})
      test_doctor.save()
      test_doctor2 = Doctor.new({:name => "Sally", :specialty => "feet", :id => nil})
      test_doctor2.save()
      expect(Doctor.find(test_doctor2.id())).to(eq(test_doctor2))
    end
  end

  describe("#patients") do
    it("returns an array of patients for a specific doctor") do
      test_doctor = Doctor.new({:name => "Jackie", :specialty => "feet", :id => nil})
      test_doctor.save()
      test_patient = Patient.new({:name => "Lizzie", :birthday => "1992-01-07 00:00:00", :doctor_id => test_doctor.id(), :id => nil})
      test_patient.save()
      test_patient2 = Patient.new({:name => "Roger", :birthday => "1997-01-08 00:00:00", :doctor_id => test_doctor.id(), :id => nil})
      test_patient2.save()
      expect(test_doctor.patients()).to(eq([test_patient, test_patient2]))
    end
  end

  describe("#==") do
    it("is the same doctor if it has the same name") do
      doctor = Doctor.new({:name => "Jackie", :specialty => "feet", :id => nil})
      doctor1 = Doctor.new({:name => "Jackie", :specialty => "feet", :id => nil})
      expect(doctor).to(eq(doctor1))
    end
  end
end
