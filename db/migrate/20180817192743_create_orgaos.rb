class CreateOrgaos < ActiveRecord::Migration[5.2]
  def change
    create_table :orgaos do |t|
      t.string :nome
      t.string :endereco
      t.references :chefe

      t.timestamps
    end
  end
end
