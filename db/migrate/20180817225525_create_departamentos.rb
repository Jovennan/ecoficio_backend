class CreateDepartamentos < ActiveRecord::Migration[5.2]
  def change
    create_table :departamentos do |t|
      t.string :nome
      t.references :orgao, foreign_key: true

      t.timestamps
    end
  end
end
