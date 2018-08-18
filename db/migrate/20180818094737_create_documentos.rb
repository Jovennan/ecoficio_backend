class CreateDocumentos < ActiveRecord::Migration[5.2]
  def change
    create_table :documentos do |t|
      t.string :nome
      t.string :descricao
      t.string :titulo
      t.string :brasao
      t.references :autor
      t.references :orgao, foreign_key: true
      t.string :visibilidade

      t.timestamps
    end
  end
end
