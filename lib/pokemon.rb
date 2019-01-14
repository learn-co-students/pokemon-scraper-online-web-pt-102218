require 'pry'
class Pokemon
  
  attr_accessor :id, :name, :type, :db
  @@all = []
  
  def initialize(id:, name:, type:, db:)
    @id = id 
    @db = db
    @name = name 
    @type = type
    @@all << self
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
    
  def self.find(id, db)
    out = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new(id: out[0], name: out[1], type:out[2], db:db)
  end
  
end
