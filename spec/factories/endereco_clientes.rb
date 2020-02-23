# frozen_string_literal: true

FactoryBot.define do
  factory :endereco_cliente do
    cliente
    logradouro { Faker::Address.street_name }
    numero { Faker::Address.building_number }
    bairro { Faker::Address.community }
    cidade { Faker::Address.city }
    complemento { Faker::Address.secondary_address }
    cep { Faker::Address.zip_code }
  end
end
