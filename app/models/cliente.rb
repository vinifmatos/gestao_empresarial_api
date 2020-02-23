# frozen_string_literal: true

class Cliente < ApplicationRecord
  validates :nome, :telefone, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
end
