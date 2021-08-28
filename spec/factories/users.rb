FactoryBot.define do
  factory :user do
    nickname              { 'tesuto' }
    email                 { 'aaa@gmail.com' }
    password              { 'abc1234' }
    check { '月1' }
  end
end
