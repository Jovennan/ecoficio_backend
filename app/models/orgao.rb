class Orgao < ApplicationRecord
  belongs_to :chefe, class_name: 'User'
  has_many :departamentos
  has_many :documentos_recebidos, class_name: 'Documento'
end
