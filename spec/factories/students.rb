FactoryBot.define do
  factory :student, class: Student do
    sequence(:email) { |i| "#{i}name@example.com" }
    password { 'password' }
    password_confirmation { 'password' }
    name { 'name' }
    prefecture { 'prefecture' }
    city { 'city' }
    gender { 1 }
    age { 12 }
  end
end
