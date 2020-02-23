# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Clientes', type: :request do
  before(:all) do
    create_list(:cliente, 10)
  end

  describe 'GET /clientes' do
    it 'retorna código 200 e um array com os lançamentos' do
      get clientes_path
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(Cliente.all.as_json)
    end
  end

  describe 'GET /clientes/:id' do
    it 'retorna código 200 e um json com o cliente' do
      cliente = Cliente.first
      get cliente_path(cliente)
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(cliente.as_json)
    end
  end

  describe 'POST /clientes' do
    it 'retorna código 201 e um json com cliente criado' do
      cliente = build(:cliente)
      post clientes_path, params: { cliente: cliente.attributes }
      cliente = Cliente.last
      expect(response).to have_http_status(201)
      expect(response.body).to include_json(cliente.as_json)
    end
  end

  describe 'PUT /clientes/:id' do
    it 'retorna código 201 e um json com cliente criado' do
      cliente = Cliente.select(:id, :nome).last
      cliente.nome = '0000'
      attributes = cliente.attributes
      attributes.delete('id')
      put cliente_path(cliente), params: { cliente: attributes }
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(attributes.as_json)
    end
  end

  describe 'DELETE /clientes/:id' do
    it 'retorna código 204 e body vazio' do
      cliente = Cliente.last
      delete cliente_path(cliente)
      expect(response).to have_http_status(204)
      expect(response.body).to eq('')
    end
  end
end
