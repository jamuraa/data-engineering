class CreateItemPurchases < ActiveRecord::Migration
  def change
    create_table :item_purchases do |t|
      t.belongs_to :item, index: true
      t.belongs_to :purchaser, index: true
      t.integer :count
      t.belongs_to :import_file, index: true

      t.timestamps
    end
  end
end
