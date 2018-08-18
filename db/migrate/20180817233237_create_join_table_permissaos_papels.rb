class CreateJoinTablePermissaosPapels < ActiveRecord::Migration[5.2]
  def change
    create_join_table :permissaos, :papels do |t|
      # t.index [:permissao_id, :papel_id]
      t.index [:papel_id, :permissao_id]
    end
  end
end
