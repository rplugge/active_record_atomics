class Album < ActiveRecord::Base
  belongs_to :photographer
  validates :name, presence: true
  validates :password, presence: true
end