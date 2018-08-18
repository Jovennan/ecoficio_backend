class Documento < ApplicationRecord
  belongs_to :autor, class_name: 'User'
  belongs_to :orgao
end
