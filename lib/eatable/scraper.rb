require 'open-uri'
require 'nokogiri'
require 'pry'

class Eatable::Scraper
  

  def scrape_citypage(name)
    url = 'http://' + name + '.menupages.com/'
    city_page = Nokogiri::HTML(open(url))

  end

  
end