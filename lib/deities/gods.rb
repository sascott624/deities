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
    self
  end

  def self.list_names
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
    puts "Apollo, Ares, Dionysus, Hades, Hephaestus, Hermes, Poseidon, Zeus"
    # this will iterate through @@all and return male deities
    # => return array of gods
  end

  def self.list_goddesses
    goddesses = []
    puts "Aphrodite, Artemis, Athena, Demeter, Hera, Hestia"
    # this will iterate through @@all and return female deities
    # => return array of goddesses
  end


end
