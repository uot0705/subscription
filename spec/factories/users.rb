FactoryBot.define do
  factory :user do
    nickname              { 'tesuto' }
    email                 { 'aaa@gmail.com' }
    password              { 'abc1234' }
    check { 'あり' }
  end
end
