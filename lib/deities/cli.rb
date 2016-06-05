class Deities::CLI

  def run
    create_deities
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
        binding.pry
        Deities::Gods.list_all
        # next: instantiate god objects from scrape, not just strings
      when "2"
        Deities::Gods.list_gods
        # I would like to iterate over @@all
        # and return a list of the names of all the gods
      when "3"
        Deities::Gods.list_goddesses
        # I would like to iterate over @@all
        # and return a list of the names of all the goddesses
      when "4"
        puts "Which deity are you interested in?"
        # I would like the user to be able to input a Deity.name
        # and return more information about that god or goddess
      end
    end
  end #----------menu ------------>

  def create_deities
    deity_array = Deities::Scraper.scrape_all_return_objects
    Deities::Gods.create_from_collection(deity_array)
  end

  def goodbye
    puts "Thanks for stopping by! Goodbye!"
  end

end
