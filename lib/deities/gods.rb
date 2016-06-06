class Deities::Gods

  attr_accessor :name, :url, :gender, :domain, :symbols, :roman_name

  @@all = []

  def self.all
    @@all
  end


  def initialize(deities_hash)
    deities_hash.each do |key, value|
      self.send "#{key}=", "#{value}"
    end
    @@all << self
  end


  def self.create_from_collection(deity_array)
    deity_array = Deities::Scraper.scrape_all
    deity_array.each do |deity|
      Deities::Gods.new(deity)
    end
  end


  def add_attributes(url)
    attributes = Deities::Scraper.scrape_secondary_url(url)
    attributes.each do |key, value|
      self.send "#{key}=", "#{value}"
    end
  end


  def self.list_names
    puts ""
    puts "Below is a list of all the Greek Deities:"
    puts ""
    self.all.each.with_index(1) do |deity, index|
      puts "#{index}. #{deity.name}"
      end
    puts ""
  end


  def self.list_gods
    gods = []
    Deities::Gods.all.map do |deity|
      if deity.gender == "male"
        gods << deity
      end
    end

    puts ""
    puts "Below is a list of the Greek Gods:"
    puts ""

    gods.each.with_index(1) do |deity, index|
      puts "#{index}. #{deity.name}"
    end
    puts ""
  end


  def self.list_goddesses
    goddesses = []
    Deities::Gods.all.map do |deity|
      if deity.gender == "female"
        goddesses << deity
      end
    end

    puts ""
    puts "Below is a list of the Greek Goddesses:"
    puts ""

    goddesses.each.with_index(1) do |deity, index|
      puts "#{index}. #{deity.name}"
    end
    puts ""
  end


  def self.all_names
    names = self.all.map do |deity|
      deity.name.downcase
    end
    names
  end


  def self.more_information
    puts ""
    input = gets.strip
    if input == "list"
      self.list_names
      puts "Please type the name of the deity you would like more information on. Otherwise, type exit."
      self.more_information
    elsif input == "exit"
      puts "Thanks for stopping by! Goodbye!"
      exit
    elsif self.all_names.include? (input)
      self.all.each do |deity|
        if input.downcase == deity.name.downcase
          puts ""
          puts "Name: " + deity.name
          puts "Domain: " + deity.domain
          puts "Symbols: " + deity.symbols
          puts "Roman Name: " + deity.roman_name
          puts ""
          puts "If you would like more information on another deity, please type deity name. Otherwise, type exit."
          self.more_information
        end
      end
    else
      puts ""
      puts "I'm sorry, that is not a valid deity name. Please either type list or exit."
      self.more_information
    end
  end


end
