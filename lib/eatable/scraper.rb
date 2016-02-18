require 'open-uri'
require 'nokogiri'
require 'pry'

class Eatable::Scraper

  NUTS = /nut|almond|cashew|macadamia|pecan|pigñolia|pistachio|praline|pesto|filbert/
  SHELL_FISH = /shrimp|clam|mussel|lobster|crab|prawn/
  

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

    self.filter_menus(menus_array)
  end



  def self.filter_menus(menus_array)
    valid_restaurants = []

    menus_array[0..10].each do |menu|
      menupg = Nokogiri::HTML(open(menu))
      menu_body = (menupg.css('div #restaurant-menu').text.gsub(/\r\n/, "").gsub(/\u00A0/, "")).downcase
      # --------------- Adjust tolerence level for number of search terms -----------------------------
      if (menu_body.scan(NUTS).length <= 2) && (menu_body.scan(SHELL_FISH).length <= 2) && (menu_body.length > 20)
        restaurant = {
          "name" => menupg.css('div h1.title1respage').text,
          "address" => "#{menupg.css('span.addr').text}",
          "phone" => menupg.css('li.phonenew').text.gsub(/[\\rn\s]/, "")
          }

        valid_restaurants << restaurant        
      end
    end
    valid_restaurants
  end      


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
  
  
end