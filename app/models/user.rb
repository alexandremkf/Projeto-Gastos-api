class User < ApplicationRecord
    has_many :gastos, dependent: :destroy
end