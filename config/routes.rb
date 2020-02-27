# frozen_string_literal: true

Rails.application.routes.draw do
  resources :fornecedores
  resources :caixas
  resources :pedido_itens
  resources :pedidos
  resources :produtos
  resources :endereco_clientes
  resources :clientes
  post '/listar_clientes_por_nome', to: 'clientes#listar_por_nome', as: 'listar_por_nome'
end
