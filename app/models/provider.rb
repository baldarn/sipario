class Provider < ApplicationRecord
  has_many :owners

  validates :lonlat, presence: true
end
