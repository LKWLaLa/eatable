class Eatable::Restaurant

  @@all

  attr_accessor :name, :address, :phone, :website, :menu

  def initialize(hash)
    hash.each {|k, v|  self.send('#{k}=', v)}
    @@all << self
  end

  def self.all
    @@all
  end

  def self.reset
    self.class.all.clear
  end


  
end