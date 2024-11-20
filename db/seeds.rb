# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

provider = Provider.create!(
  name: "Ristorante",
  minutes_for_points: 60,
  lonlat: "POINT(1 1)"
)

provider.awards.create!(
  name: "Sconto 5%",
  description: "sconto 5 percento per gli acquisti di bevande",
  points_to_redeem: 10
)

provider_2 = Provider.create!(
  name: "Teatro",
  minutes_for_points: 30,
  lonlat: "POINT(1 2)"
)

provider_2.awards.create!(
  name: "Biglietto a metà prezzo",
  description: "Biglietto a metà prezzo per gli spettacoli del teatro",
  points_to_redeem: 20
)
owner = Owner.create!(
  email: "owner@email.com",
  password: "password",
  provider:
)

owner.skip_confirmation!
owner.save!

user = User.create!(
  email: "user@email.com",
  password: "password"
)

user.skip_confirmation!
user.save!
device_identifier = "123123"

cp = CertifiedPresence.create!(
  owner:,
  device_identifier:
)

30.times do
  sipario_session = SiparioSession.create!(
    user:,
    provider:,
    device_identifier:,
    nearby_identifiers: "321321,567567"
  )

  user.point_events.create!(
    provider:,
    sipario_session:,
    points: 1
  )
end

10.times do
  sipario_session = SiparioSession.create!(
    user:,
    provider: provider_2,
    device_identifier:,
    nearby_identifiers: "321321,567567"
  )

  user.point_events.create!(
    provider: provider_2,
    sipario_session:,
    points: 1
  )
end
