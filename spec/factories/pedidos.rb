# frozen_string_literal: true

FactoryBot.define do
  factory :pedido do
    cliente
    situacao { :em_aberto }
    prazo_entrega { 0 }
    data_entrega { nil }

    transient do
      itens_count { 10 }
    end

    after(:build) do |pedido, vars|
      pedido.pedido_itens = build_list(:pedido_item, vars.itens_count, pedido: pedido)
    end
  end
end
