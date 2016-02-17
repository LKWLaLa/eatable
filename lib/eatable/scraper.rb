require 'open-uri'
require 'nokogiri'
require 'pry'

class Eatable::Scraper
  

  def scrape(city_name)
    city_url = 'http://' + city_name + '.menupages.com/'
    citypg = Nokogiri::HTML(open(city_url))

    citypg.css('#image-map area'). each do |a|
      neighborhood_url = a.attr('href')
      puts neighborhood_url
    end
  end
  

  #iterate through restaurants and follow links to their menues

  #return restaurants with 2 or fewer occurances of allergen terms

  #add valid restaurants to hash, and then Restaurant instances out of the hash data
  

  
end