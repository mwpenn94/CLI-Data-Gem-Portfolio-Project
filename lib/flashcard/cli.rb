class Flashcard::CommandLineInterface
def start
  Flashcard::Lesson.new_from_url
  progress
  menu
end

  def progress
    test_size = Flashcard::Lesson.test.size
    all_size = Flashcard::Lesson.all.size
    progress_ratio = test_size.to_f / all_size.to_f
    progress_percent = progress_ratio.to_f * 100
    puts ""
    puts "Your progress is currently:"
    puts "#{progress_percent} percent"
    puts ""
  end

  def menu
    puts ""
    puts "What would you like to do?"
    input = nil
    while input != "exit"
      puts "What would you like to do?"
      puts ""
      puts "Enter 'progress' to see your current progress."
      puts "Enter 'all lessons' to see all lessons."
      puts "Enter 'current' to see all lessons currently testable."
      puts "Enter 'add' to add an additional lesson to your test."
      puts "Enter 'remove' to remove a lesson from your test."
      puts "Enter 'test by description' for a test covering lessons by description."
      puts "Enter 'test by example' for a test covering lessons by example."
      puts "Enter 'test by combination' for a test covering lessons by either description or example."
      puts "Enter 'exit' to end the program."
      puts ""
      input = gets.strip.downcase
      if input == "progress"
        progress
      elsif input == "all lessons"
        Flashcard::Lesson.all.each.with_index(1) do |lesson, index| 
          puts "#{index}. #{lesson.name}"
          puts "---------------------"
          puts "#{lesson.description}"
          puts "#{lesson.example}"
          puts ""
        end
      elsif input == "current"
        Flashcard::Lesson.test.each.with_index(1) do |lesson, index|
          puts "#{index}. #{lesson.name}"
          puts "---------------------"
          puts "#{lesson.description}"
          puts "#{lesson.example}"
          puts ""
        end
      elsif input == "add"
        Flashcard::Lesson.add_test
      elsif input == "remove"
        Flashcard::Lesson.remove_test
      elsif input == "test by description"
        Flashcard::Lesson.description_test
      elsif input == "test by example"
        Flashcard::Lesson.example_test
      elsif input == "test by combination"
        Flashcard::Lesson.mix_test
      end
    end
    puts "Until next time!"
  end
end
