class Owner
  attr_accessor :cats
  attr_reader :name, :species

  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    save
  end

  def say_species
    return "I am a human."
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.count
    @@all.count
  end

  def self.reset_all
    @@all.clear
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

  def buy_cat(cat)
    Cat.new(cat, self)
  end 

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    Dog.all.select do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    Cat.all.select do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets 
    Cat.all.select do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    Dog.all.select do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  



end