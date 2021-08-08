FactoryBot.define do
  factory :tweet do
    tweet          {Faker::Lorem.sentence}
    association :user
  end
end
