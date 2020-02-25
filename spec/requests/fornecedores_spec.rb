# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Fornecedores', type: :request do
  before(:all) do
    create_list(:fornecedor, 10)
  end

  describe 'GET /fornecedores' do
    it 'retorna código 200 e um array com os lançamentos' do
      get fornecedores_path, params: { page: 1, per_page: 25 }
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(Fornecedor.all.page(1).per(25).as_json)
    end
  end

  describe 'GET /fornecedores/:id' do
    it 'retorna código 200 e um json com o fornecedor' do
      fornecedor = Fornecedor.first
      get fornecedor_path(fornecedor)
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(fornecedor.as_json)
    end
  end

  describe 'POST /fornecedores' do
    it 'retorna código 201 e um json com fornecedor criado' do
      fornecedor = build(:fornecedor)
      post fornecedores_path, params: { fornecedor: fornecedor.attributes }
      fornecedor = Fornecedor.last
      expect(response).to have_http_status(201)
      expect(response.body).to include_json(fornecedor.as_json)
    end
  end

  describe 'PUT /fornecedores/:id' do
    it 'retorna código 200 e um json com fornecedor atualizado' do
      fornecedor = Fornecedor.select(:id, :nome).last
      fornecedor.nome = '0000'
      attributes = fornecedor.attributes
      attributes.delete('id')
      put fornecedor_path(fornecedor), params: { fornecedor: attributes }
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(attributes.as_json)
    end
  end

  describe 'DELETE /fornecedores/:id' do
    it 'retorna código 204 e body vazio' do
      fornecedor = Fornecedor.last
      delete fornecedor_path(fornecedor)
      expect(response).to have_http_status(204)
      expect(response.body).to eq('')
    end
  end
end
