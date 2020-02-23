# frozen_string_literal: true

class Pedido < ApplicationRecord
  belongs_to :cliente
  has_many :pedido_itens

  enum situacao: { em_aberto: 0, cancelado: 1, em_andamento: 2, pronto_entrega: 3, finalizado: 4 }

  validates :situacao, presence: true
  validates :prazo_entrega, numericality: { greater_than_or_equal_to: 0 }
  validate :valida_data_entrega

  def valor
    valor = 0
    pedido_itens.each { |i| valor += i.valor_total }
    valor
  end

  private

  def valida_data_entrega
    return if data_entrega.nil?

    unless data_entrega >= created_at
      errors.add(:data_entrega, 'deve ser maior que a data do pedido')
    end
  end
end
