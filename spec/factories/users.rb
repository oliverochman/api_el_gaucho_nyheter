FactoryBot.define do
  factory :user do
    email { "user@random.com" }
    password { "password" }
    password_confirmation { "password" }
    role { "registered" }
  end
end
