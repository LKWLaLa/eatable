require 'pry'

class Eatable::CLI

  AREAS = ["New York", "San Francisco", "Los Angeles", "Philadelphia", "Boston", 
    "Chicago", "Washington, DC", "South Florida"]

    attr_accessor :a_input, :n_input, :neighborhoods, :city_name



  def call
    self.greeting
    self.select_area
    self.select_neighborhood
    self.list_restaurants
  end

  def quit
    puts "-" * 24
    puts "\nSee you later!"
    exit(0)
  end


  def greeting
    puts "_" * 85, "\n"
    puts "Hi there, welcome to Eatable!  \u{1f370} \u{1f374}"
    puts "Restaurants can currently be screened in the following areas:"
    puts "_" * 85, "\n"
    AREAS.sort.each_with_index {|a, i| puts "#{i + 1}. #{a}" }    
  end

  def select_area
    puts "\nWhich area would you like to search? (Please type the number, or 0 to quit.)"
    print "=> "    
    self.a_input = gets.strip.to_i
    if self.a_input == 0
      self.quit
    else
      puts "\nOk! Let's check #{AREAS.sort[self.a_input - 1]}..."
      puts "_" * 85, "\n"
    end
  end  
  


  def select_neighborhood
    puts "Available neighborhoods:"
    puts "-" * 24
    @city_name = (AREAS.sort[self.a_input - 1]).downcase.gsub(/\s|,/, "")
    if @city_name == "newyork"
      @city_name = "www"
    end
    @neighborhoods = Eatable::Scraper.neighborhood_scrape(@city_name)
    self.neighborhoods.each_with_index {|(k,v), i| puts "#{i + 1}. #{k}"}
    puts "\nWhere are you thinking of eating? (select the neighborhood number, or 0 to quit)"
    print "=> "
    self.n_input = gets.strip.to_i
    if self.n_input == 0
      self.quit
    else
      k = self.neighborhoods.keys
      puts "\nOk! Screening #{k[self.n_input - 1]} restaurant menus... This may take a few minutes..."
      puts "_" * 90, "\n"
    end
  end


  def list_restaurants
    valid_restaurants = Eatable::Scraper.restaurant_scrape(self.neighborhood_url)
    puts "Here are some potential options!"
    puts "-" * 31
    valid_restaurants.each do |restaurant|
      puts "\n #{restaurant["name"]}\n   #{restaurant["address"]}\n   #{restaurant["phone"]}"
    end
    puts "_" * 85 
    puts "\nWould you like to search another area? (Y/n)?"
    print "=> "
    input = gets.strip.downcase
      if input == 'y'
        self.call
      else
        quit
      end
  end


  def neighborhood_url
    k = self.neighborhoods.keys
    self.neighborhoods[k[self.n_input - 1]]
  end

  

end








