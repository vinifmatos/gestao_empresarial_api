# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Pedido, type: :model do
  before(:each) do
    @pedido = build(:pedido)
  end

  context 'validações' do
    it 'é válido' do
      expect(@pedido).to be_valid
    end

    context '#cliente' do
      it 'não pode estar em branco' do
        @pedido.cliente = nil
        expect(@pedido).not_to be_valid
        expect(@pedido.errors[:cliente]).to include('é obrigatório(a)')
      end
    end

    context '#situacao' do
      it 'não pode estar em branco' do
        @pedido.situacao = nil
        expect(@pedido).not_to be_valid
        expect(@pedido.errors[:situacao]).to include('não pode ficar em branco')
      end
    end

    context '#prazo_entrega' do
      it 'deve ser maior ou igual 0' do
        @pedido.prazo_entrega = -1
        expect(@pedido).not_to be_valid
        expect(@pedido.errors[:prazo_entrega]).to include('deve ser maior ou igual a 0')
      end
    end

    context '#data_entrega' do
      it 'não pode ser menor que a data do pedido' do
        @pedido.save
        @pedido.data_entrega = @pedido.created_at - 1.day
        expect(@pedido).not_to be_valid
        expect(@pedido.errors[:data_entrega]).to include('deve ser maior que a data do pedido')
      end
    end

    context '#data' do
      it 'não pode estar em branco' do
        @pedido.data = nil
        expect(@pedido).not_to be_valid
        expect(@pedido.errors[:data]).to include('não pode ficar em branco')
      end
    end
  end
end
