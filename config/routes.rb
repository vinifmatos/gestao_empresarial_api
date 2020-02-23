Rails.application.routes.draw do
  resources :fornecedores
  resources :caixas
  resources :pedido_itens
  resources :pedidos
  resources :produtos
  resources :endereco_clientes
  resources :clientes
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
