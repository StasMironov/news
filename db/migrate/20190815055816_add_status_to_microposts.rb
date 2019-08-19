class AddStatusToMicroposts < ActiveRecord::Migration[5.2]
  def change
    add_column :microposts, :status, :boolean
  end
end
