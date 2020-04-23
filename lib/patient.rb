class Patient 
    @@all = []

    attr_accessor :name
    def initialize(name)
        @name = name
        @@all << self
    end

    def appointments 
        Appointment.all.select {|app| app.patient.name == self.name}
    end

    def new_appointment(doctor, date)
        Appointment.new(date, self, doctor)
    end

    def doctors 
        self.appointments.map {|app| app.doctor}.uniq
    end

    def self.all
        @@all
    end

end