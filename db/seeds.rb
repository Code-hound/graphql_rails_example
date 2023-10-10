# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
authors = [
  { first_name: 'A1', last_name: 'test', year_of_birth: 1977, alive: true, other_info: { topics: 'nothing' }},
  { first_name: 'X1s', last_name: 'test2', year_of_birth: 1981, alive: true, other_info: { topics: 'cooking' }},
  { first_name: 'Ys', last_name: 'cd', year_of_birth: 1981, alive: true, other_info: { topics: 'tech', related: 'creator' }}

]
authors.each do |info|
  author = Author.find_or_initialize_by(first_name: info[:first_name], last_name: info[:last_name])
  author.assign_attributes(info)
  author.save!


  FactoryBot.create :book, author: author, nr_of_following: [0, 4, 10].sample
  FactoryBot.create :book, author: author
end