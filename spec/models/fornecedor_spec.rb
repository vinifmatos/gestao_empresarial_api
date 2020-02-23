# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Fornecedor, type: :model do
  before(:each) do
    @fornecedor = build(:fornecedor)
  end

  context 'validações' do
    it 'é válido' do
      expect(@fornecedor).to be_valid
    end

    context '#nome' do
      it 'não pode estar em branco' do
        @fornecedor.nome = ''
        expect(@fornecedor).not_to be_valid
        expect(@fornecedor.errors[:nome]).to include('não pode ficar em branco')
      end
    end

    context '#telefone' do
      it 'não pode estar em branco' do
        @fornecedor.telefone = ''
        expect(@fornecedor).not_to be_valid
        expect(@fornecedor.errors[:telefone]).to include('não pode ficar em branco')
      end
    end

    context '#email' do
      it 'é um email válido' do
        @fornecedor.email = ''
        expect(@fornecedor).not_to be_valid
        expect(@fornecedor.errors[:email]).to include('não é válido')
      end
    end
  end
end
