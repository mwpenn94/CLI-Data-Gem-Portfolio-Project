class Event
    attr_accessor :name, :time, :date, :people, :location, :status

    @@all = []

    def initialize(name = nil, time = nil, date = nil, people = nil, location = nil, status = nil)
        @name = name
        @time = time
        @date = date
        @people = people
        @location = location
        @status = status
        @@all << self
    end

    def self.all
        @@all
    end

    def self.destroy_all
        all.clear
    end
    
    def save
        self.class.all << self
        self
    end

    def self.create(name = nil, time = nil, date = nil, people = nil, location = nil, status = nil)
        new(name, time, date, people, location, status).save
    end

    def self.next_available_day(name = nil, time = nil, date = nil, people = nil, location = nil, status = nil)
        new(name, time, date, people, location, status).save
    end

    def self.next_available_workday(name = nil, time = nil, date = nil, people = nil, location = nil, status = nil)
        new(name, time, date, people, location, status).save
    end

    def next_available_day
        @@all.each do |event| 
            current_dates_scheduled << event.date
            
            current_dates_scheduled.sort!
            current_dates_scheduled.last
            current_dates_scheduled.last+=1
        end
    end

    def next_available_workday
        @@all.each do |event| 
            if DateTime.parse(event.date).wday != 0
                current_dates_scheduled << event.date            
                current_dates_scheduled.sort!
                    if current_dates_scheduled.last.saturday? = true
                        next_open = current_dates_scheduled+=2
                    else
                        next_open = current_dates_scheduled+=1
                    end
                next_available_work_day
            end
        end
    end

    def schedule_next_available_workday(name = nil, time = nil, people = nil, location = nil, status = nil)
        @name = name
        @time = time
        @date = next_free_day.date
        @people = people
        @location = location
        @status = status
        @@all << self
    end

    def schedule_override_push_right(name = nil, time = nil, people = nil, location = nil, status = nil)
        @name = name
        @time = time
        @date = next_free_day.date
        @people = people
        @location = location
        @status = status
        @@all << self
    end
end
