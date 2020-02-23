# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PedidoItem, type: :model do
  before(:each) do
    @pedido_item = build(:pedido_item)
  end

  context 'validações' do
    it 'é válido' do
      expect(@pedido_item).to be_valid
    end

    context '#pedido' do
      it 'não pode estar em branco' do
        @pedido_item.pedido = nil
        expect(@pedido_item).not_to be_valid
        expect(@pedido_item.errors[:pedido]).to include('é obrigatório(a)')
      end
    end

    context '#produto' do
      it 'não pode estar em branco' do
        @pedido_item.produto = nil
        expect(@pedido_item).not_to be_valid
        expect(@pedido_item.errors[:produto]).to include('é obrigatório(a)')
      end
    end

    context '#quantidade' do
      it 'deve ser maior que 0' do
        @pedido_item.quantidade = 0
        expect(@pedido_item).not_to be_valid
        expect(@pedido_item.errors[:quantidade]).to include('deve ser maior que 0')
      end
    end

    context '#valor_unitario' do
      it 'deve ser maior que 0' do
        @pedido_item.valor_unitario = -1
        expect(@pedido_item).not_to be_valid
        expect(@pedido_item.errors[:valor_unitario]).to include('deve ser maior que 0')
      end

      it 'deve ser igual ao preço do produto' do
        @pedido_item.valor_unitario = @pedido_item.produto.preco - 1
        expect(@pedido_item).not_to be_valid
        expect(@pedido_item.errors[:valor_unitario]).to include('deve ser igual ao preço do produto')
      end
    end

    context '#valor_total' do
      it 'deve ser maior que 0' do
        @pedido_item.valor_total = 0
        expect(@pedido_item).not_to be_valid
        expect(@pedido_item.errors[:valor_total]).to include('deve ser maior que 0')
      end

      it 'deve ser igual a multiplicação da quantidade pelo valor unitario' do
        @pedido_item.valor_total = @pedido_item.quantidade * @pedido_item.valor_unitario - 1
        expect(@pedido_item).not_to be_valid
        expect(@pedido_item.errors[:valor_total]).to include('deve ser igual a multiplicação da quantidade pelo valor unitario')
      end
    end
  end
end
