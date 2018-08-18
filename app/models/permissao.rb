class Permissao < ApplicationRecord
    has_and_belongs_to_many :papels
end
