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
  name: "provider",
  lonlat: "POINT(1 1)"
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
