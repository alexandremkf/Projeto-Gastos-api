class GastosController < ApplicationController
    # Impõe algumas regras antes de executar algum método.
    before_action :set_user
    before_action :set_gasto, only: [:show, :update, :destroy]

    # Método para listar todos os gastos, do usuário pedido.
    def index
        render json: @user.gastos
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