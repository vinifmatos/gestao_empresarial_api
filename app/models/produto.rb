# frozen_string_literal: true

class Produto < ApplicationRecord
  validates :descricao, presence: true
  validates :preco, numericality: { greater_than: 0 }

  def as_json(_options)
    super(except: %i[created_at updated_at])
  end
end
