class Pokemon

    attr_accessor :id, :name, :type, :db, :hp

    def initialize(id:, name:, type:, hp:'default', db:)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp unless hp == 'default'
    end

    def self.save(pokemon, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", pokemon, type)
    end

    def self.find(id, db)
       out = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
       self.new(id:out[0],name:out[1],type:out[2], hp:out[3], db:db)
    end

    def alter_hp(id, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", id, @name)
    end
end
