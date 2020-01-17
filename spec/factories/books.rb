FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    rate { Faker::Number.between(from: 1, to: 5) }
    author { Faker::Book.author }
    genre { Faker::Book.genre }
    publisher { Faker::Book.publisher }
    shelf_id nil
  end
end