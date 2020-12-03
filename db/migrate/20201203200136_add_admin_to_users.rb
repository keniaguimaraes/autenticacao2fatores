class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :especial, :boolean
    add_column :users, :comum, :boolean
  end
end
