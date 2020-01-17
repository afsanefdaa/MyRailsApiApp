FactoryBot.define do
  factory :shelf do
    title { Faker::Lorem.word }
    created_by { Faker::FunnyName.two_word_name }
  end
end