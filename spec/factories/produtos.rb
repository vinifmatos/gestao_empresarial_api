FactoryBot.define do
  factory :produto do
    descricao { Faker::Commerce.product_name }
    preco { Faker::Commerce.price(range: 10.0..1000.0) }
  end
end
