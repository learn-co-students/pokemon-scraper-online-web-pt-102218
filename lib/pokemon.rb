
class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  
  @@all = []
  
  def initialize(id, name=nil, type=nil, hp=nil, db=nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  
  def self.find(id, database_connection)
    pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id)
    pokemon_inst = Pokemon.new(pokemon)
    pokemon_inst.id = pokemon[0][0]
    pokemon_inst.name = pokemon[0][1]
    pokemon_inst.type = pokemon[0][2]
    pokemon_inst.hp = pokemon[0][3]
    pokemon_inst
  end
  
  
  def alter_hp(hp, database_connection)
    database_connection.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

    
  
  
  
  
end


