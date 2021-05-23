class Schedule
    attr_accessor :name, :timespan_start, :timespan_end, :events

    @@all = []
    
    def initialize(name = nil, timespan_start = nil , timespan_end = nil)
        @name = name
        @start = start
        @finish = finish
        Event.new = @event
        @@all << self
    end

    def self.all
        @@all
    end

    def self.find(id)
        self.all[id-1]
    end

    def self.find_by_name(name)
        self.all.detect do |e|
            e.name.downcase.strip ==name.downcase.strip ||
            e.name.split("(").first.strip.downcase ==name.downcase.strip
        end
    end
    
    def timespan
        @timespan_start
        @timespan_end
    end

    def event
        @event
    end
    
end
  
