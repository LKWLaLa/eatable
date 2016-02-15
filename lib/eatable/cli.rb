class Eatable::CLI

  AREAS = ["New York", "San Francisco", "Los Angeles", "Philadelphia", "Boston", 
    "Chicago", "Washington, DC", "South Florida"]


  def initialize
  end

  def call
    self.greeting
  end

  def greeting
    puts "_" * 70, "\n"
    puts "Hi there!  Welcome to Eatable!  \u{1f370} \u{1f374}"
    puts "We are currently able to screen restaurants in the following areas:"
    puts "_" * 70
    AREAS.sort.each_with_index {|a, i| puts "#{i + 1}. #{a}" }    
  end

  

end