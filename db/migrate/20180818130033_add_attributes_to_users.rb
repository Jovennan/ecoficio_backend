class AddAttributesToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nome, :string
    add_column :users, :cpf, :string
    add_column :users, :cargo, :string
    add_reference :users, :departamento, foreign_key: true
  end
end
