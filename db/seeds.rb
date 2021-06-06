# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

["User", "Team", "Stock"].each do |wallet_type|
  5.times do |i|
    Wallet.create(
      type: wallet_type,
      balance: [1_000, 5_000, 10_000].sample,
      owner_name: "#{wallet_type} - #{i + 1}",
    )
  end
end
