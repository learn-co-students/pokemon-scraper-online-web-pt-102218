require 'pry'
class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  
  def initialize(id:, name:, type:, db:, hp:'nil')
    @id = id 
    @db = db
    @name = name 
    @type = type 
    @hp = hp unless hp == 'nil'
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
    self.new(id: out[0], name: out[1], type:out[2], db:db, hp:out[3])
  
  end

  def alter_hp(hp, db)
    new = db.execute ("UPDATE pokemon SET hp = 59 WHERE name = 'Pikachu'")
    newer = db.execute("UPDATE pokemon SET hp = 0 WHERE name = 'Magikarp'")
  end 



end
