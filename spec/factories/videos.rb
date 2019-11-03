FactoryBot.define do
  factory :video do
    user { create(:user) }
    sequence(:video_uuid) { |n| "video_#{n}" }
    provider { "Youtube" }
    title { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
    url { "https://www.youtube.com/watch?v=#{video_uuid}" }
  end
end
