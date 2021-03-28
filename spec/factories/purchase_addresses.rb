FactoryBot.define do
  factory :purchase_address do
    token { 'tok_abcdefghijk00000000000000000' }
    post_code { '123-4567' }
    prefecture_id { 2 }
    city { "横浜市" }
    house_num { '1-1' }
    building_name { 'マンション101' }
    phone_num { '09012345678' }
    user_id { 1 }
    item_id { 2 }
    purchase_id { 2 }
  end
end
