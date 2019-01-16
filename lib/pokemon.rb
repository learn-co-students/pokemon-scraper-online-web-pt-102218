class Pokemon
  attr_accessor :id, :name, :type, :db, :hp


  def initialize(pokemon_hash, hp = nil)
    self.id = pokemon_hash[:id]
    self.name = pokemon_hash[:name]
    self.type = pokemon_hash[:type]
    self.db = pokemon_hash[:db]
    self.hp = hp
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", [name, type])
  end

  def self.find(id, db)
    pokemon_hash = {}
    array = db.execute("SELECT * FROM pokemon WHERE id = ?", [id])
    pokemon_hash[:id] = array[0][0]
    pokemon_hash[:name] = array[0][1]
    pokemon_hash[:type] = array[0][2]
    pokemon_hash[:db] = db
    hp =  array[0][3]
    Pokemon.new(pokemon_hash, hp)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",[new_hp,self.id])
  end

end
