class Papel < ApplicationRecord
    has_and_belongs_to_many :permissaos
    has_and_belongs_to_many :users

    def has_permissao?(permissao_nome)
      return !self.permissaos.where(nome: permissao_nome).empty?
    end
end
