class Deities::CLI

  def run
    greeting
    menu
    goodbye
  end

  def greeting
    puts "Hello, and welcome to the Greek Deities Generator!"
    puts ""
    puts "What would you like to do?"
    puts ""
  end

  def menu
    puts "Please input the corresponding number 1 - 4, or exit"
    puts <<-DOC
      1. list all deities
      2. list all gods
      3. list all goddesses
      4. discover more about a specific god/goddess

    DOC

    input = nil
    while input != "exit"
      input = gets.strip
      case input
      when "1"
        puts "this is a list of all the deities"
      when "2"
        puts "this is a list of all gods"
      when "3"
        puts "this is a list of all goddesses"
      when "4"
        puts "Which deity are you interested in?"
      end
    end
  end #----------menu ------------>

  def goodbye
    puts "Thanks for stopping by! Goodbye!"
  end

end
