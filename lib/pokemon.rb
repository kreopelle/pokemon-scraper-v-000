require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id: id, name: name, type: type, db: db)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
	   sql = <<-SQL
		   SELECT * FROM pokemon WHERE id = (?)
	   SQL

     info = db.execute(sql, id)

     self.new(info)

   end

end
