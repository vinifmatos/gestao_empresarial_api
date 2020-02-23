# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pedidos', type: :request do
  before(:all) do
    create_list(:pedido, 10)
  end

  describe 'GET /pedidos' do
    it 'retorna código 200 e um array com os pedidos' do
      get pedidos_path
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(Pedido.all.as_json)
    end

    it 'retorna um array com os itens do pedido e o produto de cada item' do
      get pedidos_path
      expect(response.body).to include_json(
        [
          {
            pedido_itens: [
              {
                id: /\d*/,
                quantidade: /(?:\d*\.\d*|\d)/,
                valor_unitario: /(?:\d*\.\d*|\d)/,
                valor_total: /(?:\d*\.\d*|\d)/,
                produto: {
                  id: /\d*/,
                  descricao: /.*/
                }
              }
            ]
          }
        ]
      )
    end
  end

  describe 'GET /pedidos/:id' do
    it 'retorna código 200 e um json com o pedido' do
      pedido = Pedido.first
      get pedido_path(pedido)
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(pedido.as_json)
    end

    it 'retorna um array com os itens do pedido e o produto de cada item' do
      pedido = Pedido.first
      get pedido_path(pedido)
      expect(response.body).to include_json(
        pedido_itens: [
          {
            id: /\d*/,
            quantidade: /(?:\d*\.\d*|\d)/,
            valor_unitario: /(?:\d*\.\d*|\d)/,
            valor_total: /(?:\d*\.\d*|\d)/,
            produto: {
              id: /\d*/,
              descricao: /.*/
            }
          }
        ]
      )
    end
  end

  describe 'POST /pedidos' do
    it 'retorna código 201 e um json com pedido criado' do
      pedido = build(:pedido, cliente: create(:cliente))
      post pedidos_path, params: { pedido: pedido.attributes }
      pedido = Pedido.last
      expect(response).to have_http_status(201)
      expect(response.body).to include_json(pedido.as_json)
    end
  end

  describe 'PUT /pedidos/:id' do
    it 'retorna código 200 e um json com pedido atualizado' do
      pedido = Pedido.select(:id, :prazo_entrega).last
      pedido.prazo_entrega = 1
      attributes = pedido.attributes
      attributes.delete('id')
      put pedido_path(pedido), params: { pedido: attributes }
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(attributes.as_json)
    end
  end

  describe 'DELETE /pedidos/:id' do
    it 'retorna código 204 e body vazio' do
      pedido = Pedido.last
      delete pedido_path(pedido)
      expect(response).to have_http_status(204)
      expect(response.body).to eq('')
    end
  end
end
