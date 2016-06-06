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
    i = 1
    self.all.map do |god|
      puts "#{i}. " + god.name
        i += 1
      end
    puts ""
  end


#------- below need to be updated to interact with deity objects -------->

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

    gods.each_with_index do |deity, index|
      puts "#{index + 1}. " + "#{deity.name}"
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

    goddesses.each_with_index do |deity, index|
      puts "#{index + 1}. " + "#{deity.name}"
    end
    puts ""
  end


end
