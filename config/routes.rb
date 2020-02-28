# frozen_string_literal: true

Rails.application.routes.draw do
  resources :fornecedores
  resources :caixas
  resources :pedido_itens
  resources :pedidos
  resources :produtos
  resources :endereco_clientes
  resources :clientes
  get '/listar_clientes_por_nome', to: 'clientes#listar_por_nome'
  get '/produtos_por_descricao', to: 'produtos#listar_por_descricao'
end
