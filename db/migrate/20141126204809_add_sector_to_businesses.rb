class AddSectorToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :sector, :string
  end
end
