class Event
    attr_accessor :name, :time, :date, :people, :location, :status

    @@all = []

    def initialize(name, time, date, people, location, status)
        @name = name
        @time = time
        @date = date
        @people = people
        @location = location
        @status = status
        @@all << self
    end

    self.all
        @@all
    end

    

end
