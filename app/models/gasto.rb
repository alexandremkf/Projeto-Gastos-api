class Gasto < ApplicationRecord
  belongs_to :user

  after_save :atualizar_total_gastos
  after_destroy :atualizar_total_gastos

  private

  def atualizar_total_gastos
    user.update(total_gastos: user.gastos.sum(:valor))
  end
end
