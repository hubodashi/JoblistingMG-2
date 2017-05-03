class CreateAdvises < ActiveRecord::Migration[5.0]
  def change
    create_table :advises do |t|
      t.string :name
      t.string :email
      t.text :comment

      t.timestamps
    end
  end
end
