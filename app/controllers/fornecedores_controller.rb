class FornecedoresController < ApplicationController
  before_action :set_fornecedor, only: [:show, :update, :destroy]

  # GET /fornecedores
  def index
    @fornecedores = Fornecedor.all

    render json: @fornecedores
  end

  # GET /fornecedores/1
  def show
    render json: @fornecedor
  end

  # POST /fornecedores
  def create
    @fornecedor = Fornecedor.new(fornecedor_params)

    if @fornecedor.save
      render json: @fornecedor, status: :created, location: @fornecedor
    else
      render json: @fornecedor.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /fornecedores/1
  def update
    if @fornecedor.update(fornecedor_params)
      render json: @fornecedor
    else
      render json: @fornecedor.errors, status: :unprocessable_entity
    end
  end

  # DELETE /fornecedores/1
  def destroy
    @fornecedor.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fornecedor
      @fornecedor = Fornecedor.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def fornecedor_params
      params.require(:fornecedor).permit(:nome, :telefone, :email)
    end
end
