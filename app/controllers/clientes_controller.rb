# frozen_string_literal: true

class ClientesController < ApplicationController
  before_action :set_cliente, only: %i[show update destroy]

  # GET /clientes
  def index
    @clientes = Cliente.all.order(:id).includes(:endereco_cliente)

    paginate json: @clientes
  end

  def listar_por_nome
    @clientes = if params[:nome].present?
                  Cliente.listar_por_nome(params[:nome])
                else
                  Cliente.all.order(:nome).includes(:endereco_cliente)
                end

    paginate json: @clientes
  end

  # GET /clientes/1
  def show
    render json: @cliente
  end

  # POST /clientes
  def create
    @cliente = Cliente.new(cliente_params)

    if @cliente.save
      render json: @cliente, status: :created, location: @cliente
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /clientes/1
  def update
    if @cliente.update(cliente_params)
      render json: @cliente
    else
      render json: @cliente.errors, status: :unprocessable_entity
    end
  end

  # DELETE /clientes/1
  def destroy
    @cliente.destroy
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_cliente
    @cliente = Cliente.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def cliente_params
    params.require(:cliente).permit(
      :nome, :telefone, :email,
      endereco_cliente_attributes: %i[id logradouro numero bairro cidade cep complemento]
    )
  end
end
