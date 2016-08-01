# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cats = []

5.times { cats << Category.create!(name: Faker::Team.name) }

100.times { Article.create!(category_id: rand(1..5), title: Faker::University.name, body: Faker::Hipster.paragraphs(2))}
