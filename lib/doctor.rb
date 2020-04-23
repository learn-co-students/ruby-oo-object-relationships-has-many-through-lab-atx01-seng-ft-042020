class Doctor 
    @@all = []

    attr_accessor :name
    def initialize(name)
        @name = name
        @@all << self
    end

    def appointments 
        Appointment.all.select {|app| app.doctor.name == self.name}
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def patients 
        self.appointments.map {|app| app.patient}.uniq
    end

    def self.all
        @@all
    end

end