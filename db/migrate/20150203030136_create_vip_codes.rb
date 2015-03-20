class CreateVipCodes < ActiveRecord::Migration
  def change
    create_table :vip_codes do |t|
      t.string :code

      t.timestamps null: false
    end
  end
end
