class SiparioSession < ApplicationRecord
  belongs_to :user
  belongs_to :provider

  has_many :point_events

  validates :device_identifier, :nearby_identifiers, presence: true
end
