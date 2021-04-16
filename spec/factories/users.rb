FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.free_email }
    password              { 'aaa111' }
    password_confirmation { password }
    full_last_name        { '隆太郎' }
    full_first_name       { '山田' }
    kana_last_name        { 'ヤマダ' }
    kana_first_name       { 'リクタロウ' }
    birthday              { Faker::Date.backward }
  end
end
