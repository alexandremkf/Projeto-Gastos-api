class GastosController < ApplicationController
    # Impõe algumas regras antes de executar algum método.
    before_action :set_user
    before_action :set_gasto, only: [:update, :destroy]

    # Método para listar todos os gastos, do usuário pedido.
    def index
        gastos = @user.gastos
        render json: gastos
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
        if @gasto&.update(gasto_params)
            render json: @gasto
        else
            render json: { errors: @gasto ? @gasto.errors.full_messages : ["Gasto não encontrado."] }, status: :unprocessable_entity
        end
    end

    # Método para deletar o gasto do usuário pedido.
    def destroy
        if @gasto&.destroy
            render json: { message: "Gasto deletado com sucesso." }
        else
            render json: { errors: ["Gasto não encontrado ou não foi possível deletar."] }, status: :unprocessable_entity
        end
    end

    private

    def set_user
        @user = User.find_by(id: params[:user_id])
        unless @user
            render json: { errors: ["Usuário não encontrado."] }, status: :not_found
        end
    end
    
    def set_gasto
        @gasto = @user&.gastos&.find_by(id: params[:id])
    end
    
    def gasto_params
        params.require(:gasto).permit(:description, :value, :date)
    end
end