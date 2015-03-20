class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :hometown
      t.integer :age
      t.string :favorite
      t.string :quote

      t.timestamps null: false
    end
  end
end
