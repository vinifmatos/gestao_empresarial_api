class PedidoItensController < ApplicationController
  before_action :set_pedido_item, only: [:show, :update, :destroy]

  # GET /pedido_itens
  def index
    @pedido_itens = PedidoItem.all

    render json: @pedido_itens
  end

  # GET /pedido_itens/1
  def show
    render json: @pedido_item
  end

  # POST /pedido_itens
  def create
    @pedido_item = PedidoItem.new(pedido_item_params)

    if @pedido_item.save
      render json: @pedido_item, status: :created, location: @pedido_item
    else
      render json: @pedido_item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /pedido_itens/1
  def update
    if @pedido_item.update(pedido_item_params)
      render json: @pedido_item
    else
      render json: @pedido_item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /pedido_itens/1
  def destroy
    @pedido_item.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pedido_item
      @pedido_item = PedidoItem.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def pedido_item_params
      params.require(:pedido_item).permit(:pedido_id, :produto_id, :quantidade, :valor_unitario, :valor_total)
    end
end
