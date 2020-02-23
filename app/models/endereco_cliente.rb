class EnderecoCliente < ApplicationRecord
  belongs_to :cliente

  validates :logradouro, :bairro, :cidade, :cep, presence: true
end
