class SiparioSession < ApplicationRecord
  belongs_to :user
  belongs_to :provider

  has_one :point_event

  validates :device_identifier, presence: true

  after_save :check_certification

  def check_certification
    is_certified = CertifiedPresence
      .where(device_identifier: device_identifier)
      .where("created_at <= ?", Time.zone.now)
      .where("updated_at >= ?", Time.zone.now - 10.minutes)
      .limit(1)
      .present?

    if is_certified
      user.point_events.create(
        user:,
        provider:,
        sipario_session: self,
        points: 1
      )
    end
  end
end
