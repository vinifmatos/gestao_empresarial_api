# frozen_string_literal: true

class PedidoItem < ApplicationRecord
  belongs_to :pedido
  belongs_to :produto

  validates :quantidade, :valor_unitario, :valor_total, numericality: { greater_than: 0 }
  validate :valida_valor_total, :valida_valor_unitario

  private

  def valida_valor_unitario
    return if valor_unitario.nil? || produto.nil?

    if valor_unitario != produto.preco
      errors.add(:valor_unitario, 'deve ser igual ao preço do produto')
    end
  end

  def valida_valor_total
    return if valor_unitario.nil? || quantidade.nil?

    if valor_total != valor_unitario * quantidade
      errors.add(:valor_total, 'deve ser igual a multiplicação da quantidade pelo valor unitario')
    end
  end
end
