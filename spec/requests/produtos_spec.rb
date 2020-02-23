# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Produtos', type: :request do
  before(:all) do
    create_list(:produto, 10)
  end

  describe 'GET /produtos' do
    it 'retorna código 200 e um array com os lançamentos' do
      get produtos_path
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(Produto.all.as_json)
    end
  end

  describe 'GET /produtos/:id' do
    it 'retorna código 200 e um json com o produto' do
      produto = Produto.first
      get produto_path(produto)
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(produto.as_json)
    end
  end

  describe 'POST /produtos' do
    it 'retorna código 201 e um json com produto criado' do
      produto = build(:produto)
      post produtos_path, params: { produto: produto.attributes }
      produto = Produto.last
      expect(response).to have_http_status(201)
      expect(response.body).to include_json(produto.as_json)
    end
  end

  describe 'PUT /produtos/:id' do
    it 'retorna código 200 e um json com produto criado' do
      produto = Produto.select(:id, :descricao).last
      produto.descricao = '0000'
      attributes = produto.attributes
      attributes.delete('id')
      put produto_path(produto), params: { produto: attributes }
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(attributes.as_json)
    end
  end

  describe 'DELETE /produtos/:id' do
    it 'retorna código 204 e body vazio' do
      produto = Produto.last
      delete produto_path(produto)
      expect(response).to have_http_status(204)
      expect(response.body).to eq('')
    end
  end
end
