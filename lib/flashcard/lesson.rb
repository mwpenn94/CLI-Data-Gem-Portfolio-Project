class Flashcard::Lesson
    attr_accessor :name, :description, :example

    @@all = []
    @@test = []

    def initialize(name = nil, description = nil, example = nil)
        @name = name
        @description = description
        @example = example
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

    def self.new_from_url
        Flashcard::Scraper.scrape.each do |obj|
            lesson = Flashcard::Lesson.new
            lesson.name = obj[:name]
            lesson.description = obj[:description]
            lesson.example = obj[:example]
            lesson.save
            @@all.uniq!
        end
    end

    def self.test
        @@test
    end

    def self.destroy_test
        test.clear
    end

    def self.add_test(name = nil)
        if name == nil
            counter = 0
            previous_test = self.test.size
            while self.test.size == previous_test
                self.test << self.all[counter]
                self.test.uniq!
                counter += 1
                self.test.each.with_index(1) do |lesson, index|
                    puts "#{index}. #{lesson.name}"
                    puts "---------------------"
                    puts "#{lesson.description}"
                    puts "#{lesson.example}"
                    puts ""
                end
            end
        else
            self.test << self.all.detect{|a| a.name == name}
            self.test.uniq!
        end
    end
    
    def self.remove_test
        puts "Enter 'first', 'last', or the name of the lesson you would like to no longer be testable."
        input = gets.strip.downcase
        if input == "first"
            self.test.shift
        elsif input == "last"
            self.test.pop
        else 
            self.test.each do |lesson|
                if input == lesson.name.to_s
                    self.test.delete(lesson)
                end
            end
        end 
    end

    def self.description_test
        self.test.each do |question|
            if question.description.length > 0
                puts question.description
                puts "What is the above called? Please enter a response to proceed to the next question." 
                input = gets.strip.downcase
                if input == question.name.to_s
                    puts "Correct!"
                else 
                    puts "Incorrect!"
                    puts "The correct answer is '#{question.name}'."
                end
            end
        end
    end

    def self.example_test
        self.test.each do |question|
            if question.example.length > 0
                puts question.example
                puts "What is the above called? Please enter the correct response to proceed to the next question."
                input = gets.strip.downcase   
                if input == question.name.to_s
                    puts "Correct!"
                else 
                    puts "Incorrect!"
                    puts "The correct answer is '#{question.name}'."
                end
            end
        end
    end

    def self.mix_test
        counter = 0
        self.test.each do |question|
            if counter.to_i.even?
                if question.description.length > 0
                    puts question.description
                elsif question.example.length > 0
                    puts question.example
                end
            else
                if question.example.length > 0
                    puts question.example
                elsif question.description.length > 0
                    puts question.description
                end
            end
            puts "What is the above called? Please enter the correct response to proceed to the next question."
            input = gets.strip.downcase   
            if input == question.name.to_s
                puts "Correct!"
            else 
                puts "Incorrect!"
                puts "The correct answer is '#{question.name}'."
            end
        end
    end
end
