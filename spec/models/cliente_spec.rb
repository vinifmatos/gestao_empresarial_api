# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Cliente, type: :model do
  before(:each) do
    @cliente = build(:cliente)
  end

  context 'validações' do
    it 'é válido' do
      expect(@cliente).to be_valid
    end

    context '#nome' do
      it 'não pode estar em branco' do
        @cliente.nome = ''
        expect(@cliente).not_to be_valid
        expect(@cliente.errors[:nome]).to include('não pode ficar em branco')
      end
    end

    context '#telefone' do
      it 'não pode estar em branco' do
        @cliente.telefone = ''
        expect(@cliente).not_to be_valid
        expect(@cliente.errors[:telefone]).to include('não pode ficar em branco')
      end
    end

    context '#email' do
      it 'é um email válido' do
        @cliente.email = ''
        expect(@cliente).not_to be_valid
        expect(@cliente.errors[:email]).to include('não é válido')
      end
    end
  end
end
