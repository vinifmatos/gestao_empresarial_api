# frozen_string_literal: true

class Cliente < ApplicationRecord
  has_one :endereco_cliente, dependent: :destroy
  validates :nome, :telefone, presence: true
  validates :email, format: { with: /\A[^@\s]+@[^@\s]+\z/ }

  accepts_nested_attributes_for :endereco_cliente

  def self.listar_por_nome(nome)
    key = 'unaccent(nome) ~* unaccent(?)'
    cond_str = []
    args = []
    nome.split(' or ').each do |param|
      cond_str << key
      args << param
    end
    args = [cond_str.join(' ')] + args
    where(args).order(:nome).includes(:endereco_cliente)
  end

  def as_json(options = {})
    options[:except] ||= []
    options[:except] += %i[created_at updated_at]
    options[:include] ||= {}
    options[:include].merge!(endereco_cliente: { only: %i[id logradouro numero bairro cidade cep complemento] })
    super(options)
  end
end
