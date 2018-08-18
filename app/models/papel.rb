class Papel < ApplicationRecord
    has_and_belongs_to_many :permissaos
    has_and_belongs_to_many :users
end
