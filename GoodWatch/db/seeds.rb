# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Seeded User
User.create!(:email => 'admins@colgate.edu', :admin => true, :password => "colgate13")
u1 = User.create!(:email => 'ggrossman18@colgate.edu', :admin => false, :password => 'colgate13')

#Seeded TV Shows
b1 = Show.create!(title: "Community", creator: "Dan Harmon", number_of_seasons: 6, year: 2009, episodes: 110)
b2 = Show.create!(title: "Ozark", creator: "Bill Dubuque", number_of_seasons: 4, year: 2017, episodes: 30)
b3 = Show.create!(title: "The Wire", creator: "David Simon", number_of_seasons: 5, year: 2002, episodes: 60)
b4 = Show.create!(title: "Stranger Things", creator: "Duffer Brothers", number_of_seasons: 3, year: 2016, episodes: 25)
b5 = Show.create!(title: "Breaking Bad", creator: "Vince Gilligan", number_of_seasons: 5, year: 2008, episodes: 62)
b6 = Show.create!(title: "Planet Earth", creator: "George Fenton", number_of_seasons: 1, year: 2006, episodes: 11)
b7 = Show.create!(title: "The Sopranos", creator: "David Chase", number_of_seasons: 6, year: 1999, episodes: 86)
b8 = Show.create!(title: "Game of Thrones", creator: "David Benioff", number_of_seasons: 8, year: 2011, episodes: 73)
b9 = Show.create!(title: "Sherlock", creator: "Mark Gatiss", number_of_seasons: 4, year: 2010, episodes: 15)
b10 = Show.create!(title: "Monty Python's Flying Circus", creator: "Graham Chapman", number_of_seasons: 4, year: 1969, episodes: 45)


#Seeded Review Authors
ra1 = ReviewAuthor.create!(name: 'Bad Review 1', user_id: u1.id)
ra2 = ReviewAuthor.create!(name: 'Good Review 1', user_id: u1.id)

#Seeded Review Stars
r1 = b1.reviews.build(stars: 1, review: 'hated it', review_author_id: ra1.id)
r1.save!

r2 = b2.reviews.build(stars: 5, review: 'loved it', review_author_id: ra2.id)
r2.save!