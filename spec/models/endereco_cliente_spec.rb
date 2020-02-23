# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EnderecoCliente, type: :model do
  context 'validações' do
    before(:each) do
      @endereco = build(:endereco_cliente)
    end

    it 'é válido' do
      expect(@endereco).to be_valid
    end

    context '#cliente' do
      it 'não pode estar em branco' do
        @endereco.cliente = nil
        expect(@endereco).not_to be_valid
        expect(@endereco.errors[:cliente]).to include('é obrigatório(a)')
      end
    end

    context '#logradouro' do
      it 'não pode estar em branco' do
        @endereco.logradouro = nil
        expect(@endereco).not_to be_valid
        expect(@endereco.errors[:logradouro]).to include('não pode ficar em branco')
      end
    end

    context '#bairro' do
      it 'não pode estar em branco' do
        @endereco.bairro = nil
        expect(@endereco).not_to be_valid
        expect(@endereco.errors[:bairro]).to include('não pode ficar em branco')
      end
    end

    context '#cidade' do
      it 'não pode estar em branco' do
        @endereco.cidade = nil
        expect(@endereco).not_to be_valid
        expect(@endereco.errors[:cidade]).to include('não pode ficar em branco')
      end
    end

    context '#cep' do
      it 'não pode estar em branco' do
        @endereco.cep = nil
        expect(@endereco).not_to be_valid
        expect(@endereco.errors[:cep]).to include('não pode ficar em branco')
      end
    end
  end
end
