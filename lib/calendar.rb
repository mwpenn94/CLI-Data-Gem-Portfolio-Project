class Schedule
    attr_accessor :name, :start, :finish, :events

    @@all = []
    
    def initialize(name, start =nil , finish = nil)
        @name = name
        @start = start
        @finish = finish
        Event.new = @events
        @@all << self
    end

    def self.all
        @@all
    end
end
  
