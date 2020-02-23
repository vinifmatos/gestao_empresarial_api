# frozen_string_literal: true

class Cliente < ApplicationRecord
  has_one :endereco_cliente, dependent: :destroy
  validates :nome, :telefone, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  accepts_nested_attributes_for :endereco_cliente, allow_destroy: true

  def as_json(_options = {})
    super(
      # root: true,
      except: %i[created_at updated_at],
      include: { endereco_cliente: { only: %i[id logradouro numero bairro cidade cep] } }
    )
  end
end
