class AddAvgrtToUsers < ActiveRecord::Migration
  def change
    add_column :users, :avgrt, :float
  end
end
