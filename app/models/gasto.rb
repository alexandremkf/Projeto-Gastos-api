class Gasto < ApplicationRecord
  belongs_to :user

  private

  def atualizar_total_gastos
    user.update(total_gastos: user.gastos.sum(:valor))
  end
end
