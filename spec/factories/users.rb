FactoryBot.define do
  factory :user do
    nickname {Faker::Name.name}
    email {Faker::Internet.free_email}
    password {"a123456"}
    password_confirmation {"a123456"}
    family_name {"山田"}
    first_name {"太郎"}
    family_name_kana {"ヤマダ"}
    first_name_kana {"タロウ"}
    birthday{Faker::Date.birthday}
  end
end