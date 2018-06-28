require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
  end


  def self.save(name, type, hp = 60, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
     info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
     Pokemon.new(id:info[0], name:info[1], type:info[2], db:db)
   end

  #  def bonus(hp, id, db)
  #    hp_adjust = db.execute("UPDATE pokemon SET hp=? WHERE id=?", hp, id)
  #  end

end
