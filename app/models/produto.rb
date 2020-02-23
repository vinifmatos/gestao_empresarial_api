# frozen_string_literal: true

class Produto < ApplicationRecord
  validates :descricao, presence: true
  validates :preco, numericality: { greater_than: 0 }
end
