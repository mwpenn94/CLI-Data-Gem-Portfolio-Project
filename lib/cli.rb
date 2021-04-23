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

  def start
    list
    input = nil
    while input != "exit"
      puts ""
      puts "What's next?"
      puts ""
      puts "Enter 'list' to see your current schedule."
      puts "Enter an event name to see details related to that event."
      puts "Enter 'add' to add a new event."
      puts "Enter 'adjust' to update an event for a specific date and/or time. Unless previously specified per your schedule, all concurrent and subsequent events will reschedule for the next available later time to provide ample space for your new adjustment."
      puts "Enter 'remove' to remove an event from your current schedule."
      puts "Enter 'exit' to end the program."
      puts ""
      input = gets.strip
      if input == "list"
        list
      elsif input == "add"

      elsif input == "adjust"

      elsif input == "remove"

      elsif input == "exit"
      end 
  end



end
