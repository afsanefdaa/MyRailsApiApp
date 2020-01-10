# spec/factories/items.rb
FactoryBot.define do
  factory :item do
    title { Faker::Book.title }
    author { Faker::Book.author }
    shelf_id nil
  end
end