class Deities::Gods

  attr_accessor :name, :summary, :url

  @@all = []
  @@gods = []
  @@goddesses = []

  def self.list_all
    puts "Aphrodite, Apollo, Ares, Artemis, Athena, Demeter, Dionysus, Hades, Hephaestus, Hera, Hermes, Hestia, Poseidon, Zeus"
    # this will become self.scrape_all
    # => return array of all deities
  end

  def self.list_gods
    puts "Apollo, Ares, Dionysus, Hades, Hephaestus, Hermes, Poseidon, Zeus"
    # this will become self.scrape_gods
    # => return array of gods
  end

  def self.list_goddesses
    puts "Aphrodite, Artemis, Athena, Demeter, Hera, Hestia"
    # this will become self.scrape_goddesses
    # => return array of goddesses
  end


end
