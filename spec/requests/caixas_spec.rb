# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Caixas', type: :request do
  describe 'GET /caixas' do
    before(:each) do
      create_list(:caixa, 10)
    end

    it 'retorna código 200 e um array com os lançamentos' do
      get caixas_path
      expect(response).to have_http_status(200)
      expect(response.body).to include_json(Caixa.all.as_json)
    end
  end
end
