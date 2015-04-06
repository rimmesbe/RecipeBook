# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
ryan = User.create(name: 'Ryan', password: '1234')
toria = User.create(name: 'Toria', password: '1234')

chicken_pot_pie = Recipe.create(title: 'Chicken Pot Pie', instruction: 'Mush it together and bake for 45 minutes.', user: ryan)
ravioli = Recipe.create(title: 'Ravioli', instruction: 'throw some jared sauce on there and eat it', user: toria)
