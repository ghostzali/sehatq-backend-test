FactoryBot.define do
  factory :specialty, class: Specialty do
    name { Faker::FunnyName.name }
  end
end
