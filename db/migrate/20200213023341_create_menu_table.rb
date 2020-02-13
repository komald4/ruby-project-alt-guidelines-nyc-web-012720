class CreateMenuTable < ActiveRecord::Migration[5.2]
  def change
    create_table :menus do |t|
      t.string :item
      t.timestamp
    end
  end
end
