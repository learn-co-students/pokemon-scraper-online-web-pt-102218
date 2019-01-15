require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db: nil, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

   def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
  end

  def self.find(id, db)
    a = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(:id => a[0], :name => a[1], :type => a[2])
  end

  def alter_hp(hp)
    self.hp = hp
  end
end
