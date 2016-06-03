class Deities::Gods

  attr_accessor :name, :summary, :url

  def self.list_all
    all = []
    puts "Aphrodite, Apollo, Ares, Artemis, Athena, Demeter, Dionysus, Hades, Hephaestus, Hera, Hermes, Hestia, Poseidon, Zeus"
    # this will become self.scrape_all
    # => return array of all deities
  end

  def self.list_gods
    gods = []
    puts "Apollo, Ares, Dionysus, Hades, Hephaestus, Hermes, Poseidon, Zeus"
    # this will become self.scrape_gods
    # => return array of gods
  end

  def self.list_goddesses
    goddesses = []
    puts "Aphrodite, Artemis, Athena, Demeter, Hera, Hestia"
    # this will become self.scrape_goddesses
    # => return array of goddesses
  end

  def self.scrape_all
    doc = Nokogiri::HTML(open('http://greekgodsandgoddesses.net/'))
    binding.pry
  end


end
