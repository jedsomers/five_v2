class AddBusinessRefToUsers < ActiveRecord::Migration
  def change
    add_reference :users, :business, index: true
  end
end
