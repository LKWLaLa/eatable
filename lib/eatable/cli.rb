class Eatable::CLI

  AREAS = ["New York", "San Francisco", "Los Angeles", "Philadelphia", "Boston", 
    "Chicago", "Washington, DC", "South Florida"]

    attr_accessor :a_input, :n_input, :neighborhoods



  def call
    self.greeting
    self.select_area
    self.select_neighborhood
  end

  def greeting
    puts "_" * 70, "\n"
    puts "Hi there, welcome to Eatable!  \u{1f370} \u{1f374}"
    puts "Restaurants can currently be screened in the following areas:"
    puts "_" * 70
    AREAS.sort.each_with_index {|a, i| puts "#{i + 1}. #{a}" }    
  end

  def select_area
    puts "\nWhich area would you like to search? (Please type the number.)"
    print "=> "
    self.a_input = gets.strip.to_i
    puts "\nOk! Let's check #{AREAS.sort[self.a_input - 1]}..."
    puts "_" * 70, "\n"
  end


  def neighborhoods=(city_name)
    @neighborhoods = Eatable::Scraper.neighborhood_scrape(city_name)
  end


  def select_neighborhood
    puts "Available neighborhoods:"
    puts "-" * 24
    city_name = (AREAS.sort[self.a_input - 1]).downcase.gsub(/\s|,/, "")
    if city_name == "newyork"
      city_name = "www"
    end
    self.neighborhoods=(city_name)
    self.neighborhoods.each_with_index {|(k,v), i| puts "#{i + 1}. #{k}"}
    puts "\nWhere are you thinking of eating? (select the neighborhood number)"
    print "=> "
    self.n_input = gets.strip.to_i
    k = self.neighborhoods.keys
    puts "\nOk! Screening #{k[self.n_input - 1]} restaurant menus..."
    puts "_" * 70, "\n"
    puts self.neighborhoods[k[self.n_input - 1]]
  end



  def restaurant_link
  end

  

end








