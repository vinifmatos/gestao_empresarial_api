# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Caixas', type: :request do
  describe 'GET /caixas' do
    it 'retorne código 200' do
      get caixas_path
      expect(response).to have_http_status(200)
    end
  end
end
