# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Admin.create(email: 'admin@abilisim.com.tr', password: '12341234', password_confirmation: '12341234')
Teacher.create(name: 'Hoca', email: 'teacher@abilisim.com.tr', password: '12341234', password_confirmation: '12341234')
User.create(name: 'Ogrenci', email: 'caliskan@cocuk.com', password: '12341234', password_confirmation: '12341234')
