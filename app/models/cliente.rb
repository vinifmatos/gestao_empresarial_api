# frozen_string_literal: true

class Cliente < ApplicationRecord
  has_one :endereco_cliente, dependent: :destroy
  validates :nome, :telefone, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  accepts_nested_attributes_for :endereco_cliente, allow_destroy: true
end
