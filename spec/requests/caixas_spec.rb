# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Caixas', type: :request do
  before(:each) do
    create_list(:caixa, 10)
  end

  describe 'GET /caixas' do
    it 'retorna código 200 e um array com os lançamentos' do
      get caixas_path
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(Caixa.all.as_json)
    end
  end

  describe 'GET /caixas/:id' do
    it 'retorna código 200 e um json com o caixa' do
      caixa = Caixa.first
      get caixa_path(caixa)
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(caixa.as_json)
    end
  end

  describe 'POST /caixas' do
    it 'retorna código 201 e um json com caixa criado' do
      caixa = build(:caixa)
      post caixas_path, params: { caixa: caixa.attributes }
      caixa = Caixa.last
      expect(response).to have_http_status(201)
      expect(response.body).to include_json(caixa.as_json)
    end
  end

  describe 'PUT /caixas/:id' do
    it 'retorna código 200 e um json com caixa criado' do
      caixa = Caixa.select(:id, :valor).last
      caixa.valor = caixa.valor + 2
      attributes = caixa.attributes
      attributes.delete('id')
      put caixa_path(caixa), params: { caixa: attributes }
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(attributes.as_json)
    end
  end

  describe 'DELETE /caixas/:id' do
    it 'retorna código 204 e body vazio' do
      caixa = Caixa.last
      delete caixa_path(caixa)
      expect(response).to have_http_status(204)
      expect(response.body).to eq('')
    end
  end
end
