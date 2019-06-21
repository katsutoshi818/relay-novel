class Title < ApplicationRecord
  has_many :sentences
  belongs_to :genre
  belongs_to :user

  validates :name, presence: true
  validates :genre_id, presence: true
end
