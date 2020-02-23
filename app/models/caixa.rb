# frozen_string_literal: true

class Caixa < ApplicationRecord
  belongs_to :pedido, optional: true
  belongs_to :fornecedor, optional: true

  enum tipo: { conta_a_receber: 0, conta_a_pagar: 1 }
  enum situacao: { em_aberto: 0, cancelado: 1, baixado: 2, estornado: 3 }

  validates :valor, numericality: { greater_than: 0 }, if: :conta_a_receber?
  validates :valor, numericality: { less_than: 0 }, if: :conta_a_pagar?
  validates :data, presence: true
  validates :data_baixa, absence: true, unless: :baixado?
  validates :data_baixa, presence: true, if: :baixado?
  validate :valida_valor_com_valor_pedido

  private

  def valida_valor_com_valor_pedido
    return if pedido.nil?

    if valor != pedido.valor
      errors.add(:valor, 'deve ser igual ao valor do pedido')
    end
  end
end
