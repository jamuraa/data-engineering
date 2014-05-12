class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :merchant, index: true
      t.integer :price_in_cents
      t.text :description

      t.timestamps
    end
  end
end
