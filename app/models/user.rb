class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  has_many :sipario_sessions
  has_many :point_events

  def total_points
    point_events.sum(:points)
  end

  def points_for_provider(provider)
    point_events.where(provider:).sum(:points)
  end

  def redeem_award(award)
    point_events.create(
      provider: award.provider,
      award:,
      consume_code: SecureRandom.uuid,
      points: - award.points_to_redeem
      )
  end
end
