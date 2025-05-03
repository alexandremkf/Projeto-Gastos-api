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

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :password)
  end
end