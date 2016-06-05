class Deities::Gods

  attr_accessor :name, :summary, :url, :gender

  @@all = []

  def self.all
    @@all
  end

  def initialize(gods_hash)
    # from the Deities::Scraper.scrape_all
  end

  def self.list_all
    puts ""
    Deities::Scraper.scrape_all.each_with_index do |name, index|
      puts "#{index + 1}. #{name}"
    end
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
