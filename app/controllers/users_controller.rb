class UsersController < ApplicationController
  # Método para listar todos os usuários, mesmo apenas existindo um único.
  def index
    users = User.all
    render json: users
  end  
  
  # Método de criar o usuário.
  def create
    user = User.new(user_params)

    if user.save
      render json: user, status: :created
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  # Método de editar e atualizar o usuário.
  def update
    user = User.find_by(id: params[:id])
    if user&.update(user_params)
      render json: user
    else
      render json: { errors: user ? user.errors.full_messages : ["Usuário não encontrado"] }, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password)
  end
end