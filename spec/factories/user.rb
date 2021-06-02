FactoryBot.define do
  factory :user, class: User do
    username { Faker::Internet.username }
    email { Faker::Internet.email }
    fullname { Faker::Internet.name }
    password { Faker::Internet.password }
    role { create(:role) }
  end

  factory :user_admin, class: User do
    username { 'admin' }
    email { 'admin@mail.com' }
    fullname { 'Admin' }
    password { 'password' }
    role { create(:role_admin) }
  end

  factory :user_staff, class: User do
    username { 'staff' }
    email { 'staff@mail.com' }
    fullname { 'Staff' }
    password { 'password' }
    role { create(:role_staff) }
  end

  factory :user_customer, class: User do
    username { 'customer' }
    email { 'customer@mail.com' }
    fullname { 'Customer' }
    password { 'password' }
    role { create(:role_customer) }
  end
end
