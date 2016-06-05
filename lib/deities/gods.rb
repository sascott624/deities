class Deities::Gods

  attr_accessor :name, :summary, :url, :gender

  @@all = []

  def self.all
    @@all
  end

  def initialize(deities_hash)
    # from the Deities::Scraper.scrape_all
    deities_hash.each do |key, value|
      self.send "#{key}=", "#{value}"
    end
    @@all << self
  end

  def self.create_from_collection(deity_array)
    # deity_array is the scraped_deities array returned from scrape_all
    deity_array = Deities::Scraper.scrape_all_return_objects
    deity_array.each do |deity|
      Deities::Gods.new(deity)
    end
  end

  def self.list_all
    puts ""
    binding.pry
    # names = Deities::Scraper.scrape_all
    # names.each_with_index do |name, index|
    #   puts "#{index + 1}. #{name}"
    # end
    # need to adjust this - Gods as objects, not strings
    puts ""
  end

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
