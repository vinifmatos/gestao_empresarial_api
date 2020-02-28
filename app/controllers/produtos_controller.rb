# frozen_string_literal: true

class ProdutosController < ApplicationController
  before_action :set_produto, only: %i[show update destroy]

  def listar_por_descricao
    @produtos = if params[:descricao].present?
                  Produto.listar_por_descricao(params[:descricao])
                else
                  Produto.all.order(:id)
                end

    paginate json: @produtos
  end

  # GET /produtos
  def index
    @produtos = Produto.all.order(:id)

    paginate json: @produtos
  end

  # GET /produtos/1
  def show
    render json: @produto
  end

  # POST /produtos
  def create
    @produto = Produto.new(produto_params)

    if @produto.save
      render json: @produto, status: :created, location: @produto
    else
      render json: @produto.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /produtos/1
  def update
    if @produto.update(produto_params)
      render json: @produto
    else
      render json: @produto.errors, status: :unprocessable_entity
    end
  end

  # DELETE /produtos/1
  def destroy
    @produto.destroy
  rescue ActiveRecord::InvalidForeignKey
    render json: { produto: 'Não é possível excluir esse produto. Ele já foi utilizado em um pedido.' }, status: :unprocessable_entity
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_produto
    @produto = Produto.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def produto_params
    params.require(:produto).permit(:descricao, :preco)
  end
end
