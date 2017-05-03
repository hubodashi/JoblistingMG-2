class AddIsMangerToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :is_manger, :boolean, default: false
  end
end
