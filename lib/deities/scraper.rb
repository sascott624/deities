require 'pry'

class Deities::Scraper

  def self.scrape_all
    # next step: instantiate gods as objects, instead of just text
    all_names = []
    urls = []
    doc = Nokogiri::HTML(open('http://greekgodsandgoddesses.net/'))
    buttons_nodeset = doc.css('.deity-list')
    buttons = buttons_nodeset.css('li')
    links = buttons.css('a')
    links.each do |l|
      all_names << l.text
      urls << l['href']
    end
    all_names
  end #-------scrape_all----------->

  def self.scrape_all_return_objects
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
