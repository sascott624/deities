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
      when "3"
        Deities::Gods.list_goddesses
      when "4"
        puts ""
        puts "Which deity are you interested in? Please enter a deity name, or type list to view the list of deities"
        Deities::Gods.more_information
      end
    end
  end #---------- menu ------------>


  def goodbye
    puts "Thanks for stopping by! Goodbye!"
  end

end
