# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database...'

Coffeehouse.destroy_all
User.destroy_all
Category.destroy_all
CheckIn.destroy_all
puts 'Creating users...'

kaka = User.create!(
  first_name: "Karine",
  last_name: "Gazarian",
  username: "Kaka",
  email: "karine@kaka.ka",
  password: "karine1991",
  )
puts 'Creating Coffeehouses...'

coffeegang = Coffeehouse.create(
name: "Coffeegang",
location: "Zülpicher Platz, Köln",
openingtime: "Monday's: closed; Tuesday- Saturday 10am - 7pm",
latitude: 50.930406,
longitude: 6.940791,
description: "The urban Coffeebar! Serving freshly brewed, fair traded Coffee, home made delicious Cakes and Snacks and a friendly atmosphere."
  )

puts 'Finished!'
