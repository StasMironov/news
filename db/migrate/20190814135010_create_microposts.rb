class CreateMicroposts < ActiveRecord::Migration[5.2]
  def change
    drop_table :microposts
    create_table :microposts do |t|
      t.text :content
      t.references :user, foreign_key: true

      t.timestamps
      add_index :microposts, [:user_id, :created_at]
    end
  end
end
