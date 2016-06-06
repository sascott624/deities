require 'pry'

class Deities::Scraper

  def self.scrape_all
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


  def self.scrape_secondary_url(deity_url)
    deity_attributes = {}
    secondary = Nokogiri::HTML(open(deity_url))

    deity_domain = secondary.css('div.entry-content h3').text
    deity_attributes[:domain] = deity_domain

    secondary.css('tbody tr').each do |row|
      information = row.css('strong').text.downcase
      case information
      when "gender"
        deity_attributes[:gender] = row.css('.column-2').text
      when "symbols"
        deity_attributes[:symbols] = row.css('.column-2').text
      when "roman name"
        deity_attributes[:roman_name] = row.css('.column-2').text
      end
    end
    deity_attributes
  end

end
