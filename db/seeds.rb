# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



(31..41).each do |i|
  Member.create(name: "山田#{i}", sex: '男性', email: "add#{i}@gmail.com", password: 'aaaaaa'+ i.to_s, password_confirmation: 'aaaaaa'+ i.to_s, company_id: i.to_s)
end


(2..10).each do |i|
  User.create(name: "吉田#{i}", sex: '男性', birthday: "1992年1月1日", email: "bss#{i}@gmail.com" , password: 'bbbbbb'+ i.to_s, password_confirmation: 'bbbbbb'+ i.to_s, accepted: checked_value = "true")
end