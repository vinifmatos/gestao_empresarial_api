# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Pedidos', type: :request do
  describe 'GET /pedidos' do
    it 'retorne código 200' do
      get pedidos_path
      expect(response).to have_http_status(200)
    end
  end
end
