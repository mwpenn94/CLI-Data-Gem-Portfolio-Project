require_relative "../config/environment.rb"

class CommandLineInterface
#    BASE_PATH = "https://calendar.google.com/calendar/u/0/r?pli=1"

  def call
    start
  end

  def list
    puts ""
    puts "Your schedule is currently:"
    puts ""
    .all.each.with_index(1) do |"something", "something else"|
      puts "#{something}, #{some other shit}"
    end
    puts ""
  end

  def print_event(event)
    puts ""
    puts "-----#{event.name}"
    puts ""
    puts " #{event._}"
    puts " #{event._}"
    puts " #{event._}"
    puts " #{event._}"
    puts " #{event._}"
    puts " #{event._}"
    puts ""
  end

  def start
    list
    input = nil
    while input != "exit"
      puts ""
      puts "What's next?"
      puts ""
      puts "What event, by name or number, would you like to see more info on?"
      puts "Enter 'list' to see all scheduled events."
      puts "Enter 'add' to add a new event."
      puts "Enter 'adjust' to update an event for a specific date and/or time. Unless previously specified per your schedule, all concurrent and subsequent events will reschedule for the next available later time to provide ample space for your new adjustment."
      puts "Enter 'remove' to remove an event from your current schedule."
      puts "Enter 'exit' to end the program."
      puts ""
      input = gets.strip
      if input == "list"
        list
      elsif input.to_i == 0
        if event = Calendar::Event.find_by_name(input)
          print_event(event)
        end
      elsif input.to_i > 0
        if event = Calendar::Event.find(input.to_i)
          print_event(event)
        end
      elsif input == "#{Event.any}"
        puts "First part of event name works!"
      elsif input == "add"
        puts "First part of event add works!"
      elsif input == "adjust"
        puts "First part of event adjust works!"
      elsif input == "remove"
        puts "First part of event remove works!"  
      end
    end
    puts "Until next time!"
  end
end
