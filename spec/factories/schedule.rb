FactoryBot.define do
  days = Date::DAYNAMES
  factory :schedule, class: Schedule do
    doctor { create(:doctor) }
    day_name { days.sample }
    start_time { Faker::Time.forward }
    end_time { Faker::Time.forward }
  end
end
