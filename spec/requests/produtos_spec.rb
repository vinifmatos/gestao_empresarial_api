# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Produtos', type: :request do
  describe 'GET /produtos' do
    it 'retorne código 200' do
      get produtos_path
      expect(response).to have_http_status(200)
    end
  end
end
