# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'PedidoItens', type: :request do
  describe 'GET /pedido_itens' do
    it 'retorne código 200' do
      get pedido_itens_path
      expect(response).to have_http_status(200)
    end
  end
end
