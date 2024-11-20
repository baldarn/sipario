class CertifiedPresence < ApplicationRecord
  belongs_to :owner

  validates :device_identifier, presence: true
end
