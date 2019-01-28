class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  # @@all = []
  def initialize(id:, name:, type:, db:, hp: nil)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    self.hp = hp
    # @@all << self
  end

  # def self.all
  #   @@all
  # end

  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

  def self.find(id, db)
    #  self.all.detect {|pokemon| pokemon.id == id}
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id=?",id)[0]
    self.new(id:new_pokemon[0], name:new_pokemon[1], type:new_pokemon[2], hp:new_pokemon[3], db:db)
  end

  def alter_hp(altered_hp, db)
    db.execute("UPDATE pokemon SET hp=? WHERE id=?", altered_hp, self.id)
    self.hp = altered_hp
  end
end
