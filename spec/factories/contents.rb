FactoryBot.define do
  factory :content do
    name { 'tesuto' }
    price { 1000 }
    association :user

    after(:build) do |content|
      content.image.attach(io: File.open('public/images/test.jpeg'), filename: 'test_image.png')
    end
  end
end
