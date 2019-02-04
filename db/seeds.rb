# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..5).each do |number|
  Company.create(name: '株式会社あああ' + number.to_s, ceo: '田中太郎' + number.to_s, telephone: "03-1234-5678")
end

