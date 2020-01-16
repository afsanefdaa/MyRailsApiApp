# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

100.times do
    book = Book.create(
        title: Faker::Book.title,
        rate: Faker::Number.between(from: 1, to: 5),
        author: Faker::Book.author,
        genre: Faker::Book.genre,
        publisher: Faker::Book.publisher,
        shelf_id: Faker::Number.between(from: 1, to: 5),
    )
    puts book
end