class CreateJoinTableUsersPapels < ActiveRecord::Migration[5.2]
  def change
    create_join_table :users, :papels do |t|
      # t.index [:user_id, :papel_id]
      # t.index [:papel_id, :user_id]
    end
  end
end
