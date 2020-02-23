class CaixasController < ApplicationController
  before_action :set_caixa, only: [:show, :update, :destroy]

  # GET /caixas
  def index
    @caixas = Caixa.all

    render json: @caixas
  end

  # GET /caixas/1
  def show
    render json: @caixa
  end

  # POST /caixas
  def create
    @caixa = Caixa.new(caixa_params)

    if @caixa.save
      render json: @caixa, status: :created, location: @caixa
    else
      render json: @caixa.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /caixas/1
  def update
    if @caixa.update(caixa_params)
      render json: @caixa
    else
      render json: @caixa.errors, status: :unprocessable_entity
    end
  end

  # DELETE /caixas/1
  def destroy
    @caixa.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caixa
      @caixa = Caixa.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def caixa_params
      params.require(:caixa).permit(:pedido_id, :tipo, :situacao, :valor, :data, :data_baixa)
    end
end
