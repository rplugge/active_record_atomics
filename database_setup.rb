configure :development do
  ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'community_app.db')
end

ActiveRecord::Base.logger = ActiveSupport::Logger.new(STDOUT)

require_relative "models/photographer.rb"
require_relative "models/album.rb"
require_relative "models/photo.rb"

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