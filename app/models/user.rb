class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  belongs_to :departamento, optional: true

  has_one :chefia_de_orgao, class_name: 'Orgao', foreign_key: :chefe_id
  
  has_and_belongs_to_many :papels
  has_many :documentos_enviados, class_name: 'Documento', foreign_key: :documento_id

end
