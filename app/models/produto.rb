# frozen_string_literal: true

class Produto < ApplicationRecord
  validates :descricao, presence: true
  validates :preco, numericality: { greater_than: 0 }

  def as_json(options = {})
    options[:except] ||= []
    options[:except] += %i[created_at updated_at]
    super(options)
  end

  def self.listar_por_descricao(descricao)
    key = 'unaccent(descricao) ~* unaccent(?)'
    cond_str = []
    args = []
    descricao.split(' or ').each do |param|
      cond_str << key
      args << param
    end
    args = [cond_str.join(' ')] + args
    where(args).order(:descricao)
  end
end
