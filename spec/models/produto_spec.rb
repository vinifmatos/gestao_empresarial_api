# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Produto, type: :model do
  before(:each) do
    @produto = build(:produto)
  end

  context 'validações' do
    it 'é válido' do
      expect(@produto).to be_valid
    end

    context '#descricao' do
      it 'não pode estar em branco' do
        @produto.descricao = ''
        expect(@produto).not_to be_valid
        expect(@produto.errors[:descricao]).to include('não pode ficar em branco')
      end
    end

    context '#preco' do
      it 'não pode estar em branco' do
        @produto.preco = nil
        expect(@produto).not_to be_valid
        expect(@produto.errors[:preco]).to include('não é um número')

        @produto.preco = -1.0
        expect(@produto).not_to be_valid
        expect(@produto.errors[:preco]).to include('deve ser maior que 0')
      end
    end
  end
end
