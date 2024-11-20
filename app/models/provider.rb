class Provider < ApplicationRecord
  has_many :owners
  has_many :awards

  validates :name, :lonlat, :minutes_for_points, presence: true
end
