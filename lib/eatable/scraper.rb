require 'open-uri'
require 'nokogiri'
require 'pry'

class Eatable::Scraper
  

  def neighborhood_scrape(city_name)
    neighborhoods = {}
    city_url = 'http://' + city_name + '.menupages.com/'
    citypg = Nokogiri::HTML(open(city_url))

    citypg.css('#image-map area'). each do |a|
      neighborhood_url = a.attr('href')
      name = a.attr('alt')
      neighborhoods[name] = neighborhood_url
    end
    neighborhoods
  end
  

  def 

  #iterate through restaurants and follow links to their menues

  #return restaurants with 2 or fewer occurances of allergen terms

  #add valid restaurants to hash, and then Restaurant instances out of the hash data
  

  
end