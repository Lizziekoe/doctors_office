require('spec_helper')

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

  describe("#==") do
    it("is the same doctor if it has the same name") do
      doctor = Doctor.new({:name => "Jackie", :specialty => "feet", :id => nil})
      doctor1 = Doctor.new({:name => "Jackie", :specialty => "feet", :id => nil})
      expect(doctor).to(eq(doctor1))
    end
  end
end
