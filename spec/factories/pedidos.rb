# frozen_string_literal: true

FactoryBot.define do
  factory :pedido do
    cliente
    situacao { :em_aberto }
    prazo_entrega { 0 }
    data_entrega { nil }

    after(:build) do |pedido|
      pedido.pedido_itens << build(:pedido_item, pedido: pedido)
    end
  end
end
