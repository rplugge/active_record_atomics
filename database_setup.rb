configure :development do
  require "sqlite3"
  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'community_app.db')
end

configure :production do  
  require "pg"
  db = URI.parse(ENV['DATABASE_URL'])

  ActiveRecord::Base.establish_connection(
    :adapter => db.scheme == 'postgres' ? 'postgresql' : db.scheme,
    :host     => db.host,
    :username => db.user,
    :password => db.password,
    :database => db.path[1..-1],
    :encoding => 'utf8'
  )
end

ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)


unless ActiveRecord::Base.connection.table_exists?(:photographers)
  ActiveRecord::Base.connection.create_table :photographers do |t|
    t.string :name
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:photos)
  ActiveRecord::Base.connection.create_table :photos do |t|
    t.integer :photographer_id
    t.text :url
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:albums)
  ActiveRecord::Base.connection.create_table :albums do |t|
    t.string :name
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:albums_photos)
  ActiveRecord::Base.connection.create_table :albums_photos, id: false do |t|
    t.integer :photo_id
    t.integer :album_id
  end  
end

unless ActiveRecord::Base.connection.table_exists?(:users)
  ActiveRecord::Base.connection.create_table :users do |t|
    t.string :name
    t.text :password
    t.integer :photographer_id
  end  
end