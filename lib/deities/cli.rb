class Deities::CLI

  def run
    create_deities
    add_secondary_information
    greeting
    menu
    goodbye
  end

  def create_deities
    deity_array = Deities::Scraper.scrape_all
    Deities::Gods.create_from_collection(deity_array)
  end

  def add_secondary_information
    Deities::Gods.all.each do |deity|
      deity.add_attributes(deity.url)
    end
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
        Deities::Gods.list_names
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
  end #---------- menu ------------>


  def goodbye
    puts "Thanks for stopping by! Goodbye!"
  end

end
