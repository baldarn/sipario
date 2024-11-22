class Provider < ApplicationRecord
  has_many :owners
  has_many :awards
  has_many :point_events

  validates :name, :lonlat, :minutes_for_points, presence: true
end
