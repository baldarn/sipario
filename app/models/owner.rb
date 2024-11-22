class Owner < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable, :trackable,
         :jwt_authenticatable, jwt_revocation_strategy: JwtDenylist

  belongs_to :provider, optional: true

  has_many :certified_presences

  attr_accessor :registering, :provider_name, :provider_minutes_for_points, :provider_lonlat

  validates :provider_name, :provider_minutes_for_points, :provider_lonlat, presence: true, if: -> { registering == true }
end
