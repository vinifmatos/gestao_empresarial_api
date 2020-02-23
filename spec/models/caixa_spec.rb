# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Caixa, type: :model do
  before(:each) do
    @caixa = build(:caixa)
  end

  context 'validações' do
    context '#data' do
      it 'não pode estar em branco' do
        @caixa.data = nil
        expect(@caixa).not_to be_valid
        expect(@caixa.errors[:data]).to include('não pode ficar em branco')
      end
    end

    context '#situacao diferente de baixado' do
      context '#data_baixa' do
        it 'tem que estar em branco' do
          @caixa.data_baixa = Date.today
          expect(@caixa).not_to be_valid
          expect(@caixa.errors[:data_baixa]).to include('deve ficar em branco')
        end
      end
    end

    context '#situacao baixado' do
      context '#data_baixa' do
        it 'não deve estar em branco' do
          @caixa.data_baixa = nil
          @caixa.situacao = :baixado
          expect(@caixa).not_to be_valid
          expect(@caixa.errors[:data_baixa]).to include('não pode ficar em branco')
        end
      end
    end

    context 'conta a receber' do
      context '#valor' do
        it 'tem que ser maior que 0' do
          @caixa.valor = 0
          expect(@caixa).not_to be_valid
          expect(@caixa.errors[:valor]).to include('deve ser maior que 0')
        end
      end

      context 'sem pedido e sem fornecedor' do
        it 'é valido' do
          expect(@caixa).to be_valid
        end
      end

      context 'com pedido' do
        before(:each) do
          @caixa = build(:caixa, com_pedido: true)
        end

        it 'é valido' do
          expect(@caixa).to be_valid
        end

        context '#valor' do
          it 'deve ser igual ao valor do pedido' do
            @caixa.valor = @caixa.pedido.valor - 1
            expect(@caixa).not_to be_valid
            expect(@caixa.errors[:valor]).to include('deve ser igual ao valor do pedido')
          end
        end
      end

      context 'com fornecedor' do
        before(:each) do
          @caixa = build(:caixa, com_fornecedor: true)
        end

        it 'é válido' do
          expect(@caixa).to be_valid
        end
      end
    end

    context 'conta a pagar' do
      before(:each) do
        @caixa = build(:caixa, conta_a_pagar: true)
      end

      context '#valor' do
        it 'tem que ser menor que 0' do
          @caixa.valor = 1
          expect(@caixa).not_to be_valid
          expect(@caixa.errors[:valor]).to include('deve ser menor que 0')
        end
      end

      context 'sem pedido e sem fornecedor' do
        it 'é valido' do
          expect(@caixa).to be_valid
        end
      end

      context 'com pedido' do
        before(:each) do
          @caixa = build(:caixa, conta_a_pagar: true, com_pedido: true)
        end

        it 'é invalido' do
          expect(@caixa).not_to be_valid
        end
      end

      context 'com fornecedor' do
        before(:each) do
          @caixa = build(:caixa, conta_a_pagar: true, com_fornecedor: true)
        end

        it 'é válido' do
          expect(@caixa).to be_valid
        end
      end
    end
  end
end
