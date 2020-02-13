require 'pry'

class Owner
  attr_reader :species, :name
  attr_accessor :dog, :cat, :pets
  
@@all = []

  def initialize(name)
    @name = name
    @pets = [Dog, Cat]
    @@all << self
    @species = "human"
    
  end 
  
 def say_species
   "I am a #{self.species}."
 end

  def self.all
    
    @@all
  end
  
  def self.count
    
    self.all.size
  end
  
  def self.reset_all
    
    self.all.clear
    
  end
  
  def cats
    Cat.all.select do |cat| 
      cat.owner == self
    end

  end
  
  def dogs
   Dog.all.select do |dog| 
      dog.owner == self
    end

  end
  
  def buy_cat(name)
    
    cat = Cat.new(name, self)
    
  end
  
  def buy_dog(name)
    
    dog = Dog.new(name, self)
    
  end
    
    def walk_dogs
    Dog.all.each do |dog|
      dog.mood = 'happy'
    end
  end

  def feed_cats
    Cat.all.each do |cat|
      cat.mood = 'happy'
    end
  end
  
def sell_pets
    @pets.collect do |species, instances|
      instances.each do |pet|
        pet.mood = "nervous"
      end
      instances.clear
    end
  end
 

  def list_pets
    "I have #{Dog.all.length} dog(s), and #{Cat.all.length} cat(s)."
  end

end