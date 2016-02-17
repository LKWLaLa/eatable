require 'open-uri'
require 'nokogiri'
require 'pry'

class Eatable::Scraper

  NUTS = ["nut", "almond", "cashew", "macadamia", "pecan", "pigñolia", "pistachio", "pralines", "pesto", "filbert"]
  SHELL_FISH = []
  

  def self.neighborhood_scrape(city_name)
    neighborhoods = {}
    @@city_url = 'http://' + city_name + '.menupages.com'
    citypg = Nokogiri::HTML(open(@@city_url))

    citypg.css('#image-map area').each do |a|
      neighborhood_url = a.attr('href')
      name = a.attr('alt')
      neighborhoods[name] = neighborhood_url
    end
    neighborhoods
  end

  def self.restaurant_scrape(neighborhood_url)
    menus_array = []

    self.full_neighborhood_url=(neighborhood_url)
    neighb_pg = Nokogiri::HTML(open(self.full_neighborhood_url))
    rest_table = neighb_pg.css('tbody tr td a')
    rest_table.each do|listing| 
      menus_array << listing.attr('href') unless ((listing.attr('href')).include?('grubhub') || (listing.attr('href')).include?('seamless'))
    end
    menus_array.map! {|link| self.city_url + link + "menu"}

    puts self.filter_menus(menus_array)

    #refactor to find correct css attr, so I don't need to filter for grubhub and seamless
  end


  def self.filter_menus(menus_array)
    valid_restaurants = []

    menus_array[0..50].each do |menu|
      "http://www.menupages.com/restaurants/levain-bakery/menu"
      menupg = Nokogiri::HTML(open(menu))
      menu_body = (menupg.css('div #restaurant-menu').text.gsub(/\r\n/, "")).downcase
      if !menu_body.include?('nut')
        valid_restaurants << menupg.css('div h1.title1respage').text
      end
    end
    valid_restaurants
  end

      #name = menupg.css('div h1.title1respage').text
      
      #phone = menupg.css('li.phonenew').text.gsub(/[\\rn\s]/, "")
      #address = menupg.css('span.addr').text
      #zip = menupg.css('span.city-zip').text


  def self.city_url
    @@city_url
  end

  def self.full_neighborhood_url=(neighborhood_url)
    if @@city_url == "http://www.menupages.com"
      @@full_neighborhood_url = neighborhood_url
    else
      @@full_neighborhood_url = @@city_url + neighborhood_url
    end
  end

  def self.full_neighborhood_url
    @@full_neighborhood_url
  end

  




  #return restaurants with 2 or fewer occurances of allergen terms

  #add valid restaurants to hash, and then Restaurant instances out of the hash data
  

  
end