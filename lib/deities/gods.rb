class Deities::Gods

  attr_accessor :name, :summary, :url, :gender

  @@all = []

  def self.list_all
    puts ""
    self.scrape_all.each_with_index do |name, index|
      puts "#{index + 1}. #{name}"
    end
    puts ""
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
    # next step: instantiate gods as objects, instead of just text
    all_names = []
    doc = Nokogiri::HTML(open('http://greekgodsandgoddesses.net/'))
    buttons_nodeset = doc.css('.deity-list')
    buttons_nodeset = buttons_nodeset.css('li')
    buttons_nodeset.each do |button|
      all_names << button.css('a').text
    end
    all_names
  end #-------scrape_all----------->


end
