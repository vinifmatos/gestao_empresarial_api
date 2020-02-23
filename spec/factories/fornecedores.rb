FactoryBot.define do
  factory :fornecedor do
    nome { Faker::Company.name }
    telefone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email(name: nome) }
  end
end
