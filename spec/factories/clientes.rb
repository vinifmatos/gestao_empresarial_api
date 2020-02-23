# frozen_string_literal: true

FactoryBot.define do
  factory :cliente do
    nome { Faker::Name.name }
    telefone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email(name: nome) }

    after(:buld) do |cliente|
      cliente.endereco_cliente << build(:endereco_cliente)
    end
  end
end
