# frozen_string_literal: true

class Cliente < ApplicationRecord
  has_one :endereco_cliente, dependent: :destroy
  validates :nome, :telefone, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  accepts_nested_attributes_for :endereco_cliente

  def as_json(options = {})
    options[:except] ||= []
    options[:except] += %i[created_at updated_at]
    options[:include] ||= {}
    options[:include].merge!(endereco_cliente: { only: %i[id logradouro numero bairro cidade cep complemento] })
    super(options)
  end
end
