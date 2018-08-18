class Departamento < ApplicationRecord
  belongs_to :orgao
  has_many :users
end
