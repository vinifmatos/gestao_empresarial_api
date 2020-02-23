# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'EnderecoClientes', type: :request do
  describe 'GET /endereco_clientes' do
    it 'retorne código 200' do
      get endereco_clientes_path
      expect(response).to have_http_status(200)
    end
  end
end
