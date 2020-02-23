class EnderecoClientesController < ApplicationController
  before_action :set_endereco_cliente, only: [:show, :update, :destroy]

  # GET /endereco_clientes
  def index
    @endereco_clientes = EnderecoCliente.all

    render json: @endereco_clientes
  end

  # GET /endereco_clientes/1
  def show
    render json: @endereco_cliente
  end

  # POST /endereco_clientes
  def create
    @endereco_cliente = EnderecoCliente.new(endereco_cliente_params)

    if @endereco_cliente.save
      render json: @endereco_cliente, status: :created, location: @endereco_cliente
    else
      render json: @endereco_cliente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /endereco_clientes/1
  def update
    if @endereco_cliente.update(endereco_cliente_params)
      render json: @endereco_cliente
    else
      render json: @endereco_cliente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /endereco_clientes/1
  def destroy
    @endereco_cliente.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_endereco_cliente
      @endereco_cliente = EnderecoCliente.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def endereco_cliente_params
      params.require(:endereco_cliente).permit(:cliente_id, :logradouro, :numero, :bairro, :cidade, :complemento, :cep)
    end
end
