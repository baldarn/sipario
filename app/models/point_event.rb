class PointEvent < ApplicationRecord
  belongs_to :provider
  belongs_to :user

  belongs_to :sipario_session, optional: true
  belongs_to :award, optional: true

  validates :points, presence: true
end
