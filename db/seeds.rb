# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# generate category data
categories = [
  'ニュース',
  '共有事項',
  '社内ノウハウ'
]

categories.size.times do |i|
  Category.create(
    'name' => categories[i]
  )
end
