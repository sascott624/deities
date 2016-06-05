require 'pry'

class Deities::Scraper

  def self.scrape_all
    #instantiate gods as objects, instead of just text
    scraped_gods = []
    doc = Nokogiri::HTML(open('http://greekgodsandgoddesses.net/'))
    buttons_nodeset = doc.css('.deity-list')
    buttons = buttons_nodeset.css('li')
    links = buttons.css('a')
    links.each do |l|
      deity_name = l.text
      deity_url = l['href']
      scraped_gods << {name: deity_name, url: deity_url}
    end
    scraped_gods
  end #-------scrape_all----------->
end
