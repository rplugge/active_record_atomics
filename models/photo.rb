class Photo < ActiveRecord::Base
  belongs_to :photographers
  has_and_belongs_to_many :albums
  validates :photographer_id, presence: true
  validates :url, presence: true
  
  def top_photo?
    if self.albums.length >= 3
      return true
    else
      return false
    end
  end
end
