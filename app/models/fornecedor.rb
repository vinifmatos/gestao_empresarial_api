# frozen_string_literal: true

class Fornecedor < ApplicationRecord
  validates :nome, :telefone, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  def as_json(options = {})
    options[:except] ||= []
    options[:except] += %i[created_at updated_at]
    super(options)
  end
end
