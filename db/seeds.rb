# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

(1..10).each do |number|
  Company.create(name: '株式会社' + number.to_s, ceo: '田中1', established_yearmonth: "1992年1月1日" + number.to_s, telephone: "03-1234-5678")
end

(1..10).each do |number|
  Recruit.create(title: 'エンジニア募集! ' + number.to_s, company_id: number.to_s)
end

(1..10).each do |number|
  Member.create(name: '山田' + number.to_s, sex: '男性', email: 'a@gmail.com' + number.to_s, password: 'aaaaaa'+ number.to_s, password_confirmation: 'aaaaaa'+ number.to_s, company_id: number.to_s)
end

(1..10).each do |number|
  User.create(name: '田中' + number.to_s, sex: '男性', birthday: "1992年1月1日", email: 'b@gmail.com' + number.to_s, password: 'bbbbbb'+ number.to_s, password_confirmation: 'bbbbbb'+ number.to_s, company_id: number.to_s)
end