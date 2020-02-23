# frozen_string_literal: true

FactoryBot.define do
  factory :caixa do
    transient do
      com_fornecedor { false }
      com_pedido { false }
      conta_a_pagar { false }
    end

    pedido { com_pedido ? create(:pedido) : nil }
    fornecedor { com_fornecedor ? build(:fornecedor) : nil }
    tipo { conta_a_pagar ? :conta_a_pagar : :conta_a_receber }
    situacao { :em_aberto }
    valor do
      v = com_pedido ? pedido.valor : Faker::Number.within(range: 10.0..1000.0)
      v *= -1 if conta_a_pagar
      v
    end
    data { com_pedido ? pedido.created_at : Faker::Date.in_date_period }
    data_baixa { nil }
  end
end
