# frozen_string_literal: true

class Pedido < ApplicationRecord
  belongs_to :cliente
  has_many :pedido_itens, dependent: :destroy

  accepts_nested_attributes_for :pedido_itens, allow_destroy: true

  enum situacao: { em_aberto: 0, cancelado: 1, em_andamento: 2, pronto_entrega: 3, finalizado: 4 }

  validates :situacao, presence: true
  validates :prazo_entrega, numericality: { greater_than_or_equal_to: 0 }
  validate :valida_data_entrega

  alias_attribute :data, :created_at

  def valor
    valor = 0
    pedido_itens.each { |i| valor += i.valor_total }
    valor
  end

  def as_json(_options = {})
    super(
      # root: true,
      except: %i[created_at updated_at],
      include: {
        pedido_itens: { only: %i[id quantidade valor_unitario valor_total], include: { produto: { only: %i[id descricao] } } }
      }
    )
  end

  private

  def valida_data_entrega
    return if data_entrega.nil?

    unless data_entrega >= created_at
      errors.add(:data_entrega, 'deve ser maior que a data do pedido')
    end
  end
end
