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

coffeegang = Coffeehouse.new(
name: "Coffeegang",
location: "Zülpicher Platz, 50674 Köln",
openingtime: "Monday's: closed; Tuesday- Saturday 10am - 7pm",
latitude: 50.930406,
longitude: 6.940791,
description: "The urban Coffeebar! Serving freshly brewed, fair traded Coffee, home made delicious Cakes and Snacks and a friendly atmosphere."
  )
coffeegang.save!

heilandt = Coffeehouse.new(
name: "Heilandt",
location: "Sülzburgstraße 1, 50937 Köln ",
openingtime: "Mo-Fr: 8am - 7pm, Saturday 9am - 7pm, Sunday 10am - 7pm",
latitude: 50.920284,
longitude: 6.927821,
description: "Good Coffee is not by chance it is an art."
  )
heilandt.save!

misspäpki = Coffeehouse.new(
name: "Miss Päpki",
location: "Brüsseler Pl. 18, 50674 Köln ",
openingtime: "Mo, Wed-Fr: 9:30am - 7:30pm, Sa & So 10:30am - 7:30pm, Tuesday's: closed",
latitude: 50.939619,
longitude: 6.933556,
description: "Die kreativsten Kuchen mit viel liebe gebacken."
  )
misspäpki.save!

hinzundkunz = Coffeehouse.new(
name: "Hinz & Kunz",
location: "Schallstraße 34, 50931 Köln",
openingtime: "Mo, Wed-Fr: 9:30am - 7:30pm, Sa & So 10:30am - 7:30pm, Tuesday's: closed",
latitude: 50.937273,
longitude: 6.920994,
description: "Best pancakes in town served with exquisit coffee and a cosy atmosphere."
  )
hinzundkunz.save!

puts 'Finished!'
