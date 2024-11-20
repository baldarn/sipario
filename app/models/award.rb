class Award < ApplicationRecord
  belongs_to :provider

  validates :name, :description, :points_to_redeem, presence: true
end
