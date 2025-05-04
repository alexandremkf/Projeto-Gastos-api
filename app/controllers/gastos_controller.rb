class GastosController < ApplicationController
    # Impõe algumas regras antes de executar algum método.
    before_action :set_user
    before_action :set_gasto, only: [:show, :update, :destroy]

    # Método para listar todos os gastos, do usuário pedido.
    def index
        render json: @user.gastos
    end

    # Método para criar um gasto para o usuário pedido.
    def create
        gasto = @user.gastos.new(gasto_params)
    
        if gasto.save
          render json: gasto, status: :created
        else
          render json: { errors: gasto.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # Método para atualizar e editar o gasto do usuário pedido.
    def update
        if @gasto.update(gasto_params)
          render json: @gasto
        else
          render json: { errors: @gasto.errors.full_messages }, status: :unprocessable_entity
        end
    end

    # Método para deletar o gasto do usuário pedido.
    def destroy
        @gasto.destroy
        head :no_content
      end

    private

    def set_user
        @user = User.find(params[:user_id])
    end
    
    def set_gasto
        @gasto = @user.gastos.find(params[:id])
    end
    
    def gasto_params
        params.require(:gasto).permit(:descricao, :valor, :data)
    end
end