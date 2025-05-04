class GastosController < ApplicationController
    # Impõe algumas regras antes de executar algum método.
    before_action :set_user
    before_action :set_gasto, only: [:show, :update, :destroy]

    # Método para listar todos os gastos, do usuário pedido.
    def index
        render json: @user.gastos
    end

end