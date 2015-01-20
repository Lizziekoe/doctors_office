require('spec_helper')

describe(Patient) do
  describe("#name") do
    it("puts out the name of the patient") do
      patient = Patient.new({:name => "Lizzie", :birthday => "01/07/1992", :doctor_id => 1, :id => nil})
      expect(patient.name()).to(eq("Lizzie"))
    end
  end

  describe("#birthday") do
    it("puts out the birthday of the patient") do
      patient = Patient.new({:name => "Lizzie", :birthday => "01/07/1992", :doctor_id => 1, :id => nil})
      expect(patient.birthday()).to(eq("01/07/1992"))
    end
  end

  describe("#doctor_id") do
    it("puts out the id of the patient's patient") do
      patient = Patient.new({:name => "Lizzie", :birthday => "01/07/1992", :doctor_id => 1, :id => nil})
      expect(patient.doctor_id()).to(eq(1))
    end
  end

  describe("#id") do
    it("puts out the id of the patient") do
      patient = Patient.new({:name => "Lizzie", :birthday => "01/07/1992", :doctor_id => 1, :id => nil})
      patient.save()
      expect(patient.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe("#save") do
    it("saves the patient info to the database") do
      patient = Patient.new({:name => "Lizzie", :birthday => "01/07/1992", :doctor_id => 1, :id => nil})
      patient.save()
      expect(Patient.all()).to(eq([patient]))
    end
  end

  describe(".all") do
    it("it starts with no patients") do
      expect(Patient.all()).to(eq([]))
    end
  end

  describe("#==") do
    it("is the same patient if it has the same name") do
      patient = Patient.new({:name => "Lizzie", :birthday => "01/07/1992", :doctor_id => 1, :id => nil})
      patient1 = Patient.new({:name => "Lizzie", :birthday => "01/07/1992", :doctor_id => 1, :id => nil})
      expect(patient).to(eq(patient1))
    end
  end
end
