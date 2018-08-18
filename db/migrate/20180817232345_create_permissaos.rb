class CreatePermissaos < ActiveRecord::Migration[5.2]
  def change
    create_table :permissaos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
