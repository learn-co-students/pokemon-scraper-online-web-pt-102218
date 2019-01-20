class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
  end
  
  def self.save(name, type, db)
    ins = db.prepare("INSERT INTO pokemon(name, type) VALUES (?, ?);")
    ins.execute(name, type)
    id = db.execute("SELECT max(id) FROM pokemon;")
    self.new(id: id, name: name, type: type, db: db)
  end
  
  def self.find(id, db)
    ins = db.prepare("SELECT * FROM pokemon WHERE id = ?;")
    found_mon = ins.execute!(id)
    # binding.pry
  end
  
  
end
