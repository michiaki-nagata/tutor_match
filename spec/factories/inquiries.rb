FactoryBot.define do
  factory :inquiry do
    name { "John Doe" }
    email { "name@example.com" }
    title{ "料金について" }
    text { "このサイトに利用料金等はかかりますか？" }
    answer { "かかりません" }
  end
end