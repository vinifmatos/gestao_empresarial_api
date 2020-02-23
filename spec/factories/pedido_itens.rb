# frozen_string_literal: true

FactoryBot.define do
  factory :pedido_item do
    pedido
    produto
    quantidade { Faker::Number.within(range: 1..10) }
    valor_unitario { produto.preco }
    valor_total { quantidade * valor_unitario }
  end
end
