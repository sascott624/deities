class Deities::Scraper

  def self.scrape_all
    # next step: instantiate gods as objects, instead of just text
    all_names = []
    # all_names will be replaced with @@all when gods are objects
    doc = Nokogiri::HTML(open('http://greekgodsandgoddesses.net/'))
    buttons_nodeset = doc.css('.deity-list')
    buttons = buttons_nodeset.css('li')
    buttons.each do |button|
      all_names << button.css('a').text
      # all_names will be replaced with @@all when gods are objects
    end
    all_names
    # all_names will be replaced with @@all when gods are objects
  end #-------scrape_all----------->

end
