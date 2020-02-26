# frozen_string_literal: true

namespace :dev do
  desc 'TODO'
  task gendata: :environment do
    FactoryBot.create_list :pedido, 500

    FactoryBot.create_list :produto, 500

    FactoryBot.create_list :cliente, 500

    FactoryBot.create_list :fornecedor, 500

    FactoryBot.create_list :caixa, 50
  end
end
