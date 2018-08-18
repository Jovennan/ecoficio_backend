class Orgao < ApplicationRecord
  belongs_to :chefe, class_name: 'User'
  has_many :departamentos
end
