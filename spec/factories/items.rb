FactoryBot.define do
  factory :item do
    name {"化粧品"}
    description {"化粧品"}
    category_id {2}
    product_status_id {3}
    shipping_burden_id {2}
    prefecture_id {2}
    shipping_days_id{2}
    price {1000}
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.jpeg'), filename: 'test_image.jpeg')
    end
  end
end
