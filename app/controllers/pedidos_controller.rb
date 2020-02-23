# frozen_string_literal: true

class PedidosController < ApplicationController
  before_action :set_pedido, only: %i[update destroy]

  # GET /pedidos
  def index
    @pedidos = Pedido.all.includes(pedido_itens: [:produto])

    render json: @pedidos
  end

  # GET /pedidos/1
  def show
    @pedido = Pedido.includes(pedido_itens: [:produto]).find(params[:id])
    render json: @pedido
  end

  # POST /pedidos
  def create
    @pedido = Pedido.new(pedido_params)

    if @pedido.save
      render json: @pedido, status: :created, location: @pedido
    else
      render json: @pedido.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pedidos/1
  def update
    if @pedido.update(pedido_params)
      render json: @pedido
    else
      render json: @pedido.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pedidos/1
  def destroy
    @pedido.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pedido
    @pedido = Pedido.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def pedido_params
    params.require(:pedido).permit(
      :cliente_id, :situacao, :prazo_entrega,
      :data_entrega,
      pedido_itens_attributes: %i[id produto_id quantidade valor_unitario valor_total _destroy]
    )
  end
end
