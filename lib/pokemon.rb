class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name:, type:, db:, hp: nil)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    self.hp = hp
  end
  
  def self.save(name, type, db)
    ins = db.prepare("INSERT INTO pokemon(name, type) VALUES (?, ?);")
    ins.execute(name, type)
    id = db.execute("SELECT max(id) FROM pokemon;")
    self.new(id: id, name: name, type: type, db: db)
  end
  
  def self.find(id, db)
    ins = db.prepare("SELECT * FROM pokemon WHERE id = ?;")
    found_mon = ins.execute!(id)[0]
    # is there hp in the database? If not, default to 60 hp
    # found_mon[3] ? hp = found_mon[3] : hp = 60
    if found_mon
      # binding.pry
      self.new(
        id: id,
        name: found_mon[1],
        type: found_mon[2],
        hp: found_mon[3],
        db: db
        )
    end
    # binding.pry
  end
  
  def alter_hp(new_hp, db)
    upd = db.prepare("UPDATE pokemon SET hp = ? WHERE id = ?")
    upd.execute(new_hp, self.id)
  end
  
end
