# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

john = User.create(full_name: "John Curry", password: "john", email: "john@john.com")

Review.create(user: john, video: ncis, rating: 3, content: "This is a really good movie")

Review.create(user: john, video: csi, rating: 2, content: "This is a really good movie")
