class Pokemon
    attr_accessor :id, :name, :type, :db, :hp
    def initialize(x)
        
        @id=x[:id]
        @name=x[:name]
        @type=x[:type]
        @db=x[:db]
        @hp=x[:hp]||60
        
    end
    def self.save(name,type,db)
        db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)", name, type)
        
    end
    def self.find(id,db)
        q=db.execute("SELECT * FROM pokemon WHERE id= ?",id)
        Pokemon.new(id:q[0][0],name:q[0][1],type:q[0][2],hp:q[0][3])
    end
    def alter_hp(hp, db)
        @hp=hp
        puts @hp
        db.execute("UPDATE pokemon SET HP= ? WHERE ID= ?",hp,self.id)
    end


end
