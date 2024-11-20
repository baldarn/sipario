class SiparioSession < ApplicationRecord
  belongs_to :user

  validates :device_identifier, :nearby_identifiers, presence: true
end
