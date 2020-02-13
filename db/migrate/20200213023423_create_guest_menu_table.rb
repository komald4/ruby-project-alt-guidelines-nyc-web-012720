class CreateGuestMenuTable < ActiveRecord::Migration[5.2]
  def change
    create_table :guest_menus do |t|
      t.integer :menu_id
      t.integer :guest_id
      t.timestamp
    end
  end
end