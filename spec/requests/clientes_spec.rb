# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Clientes', type: :request do
  describe 'GET /clientes' do
    it 'retorne código 200' do
      get clientes_path
      expect(response).to have_http_status(200)
    end
  end
end
