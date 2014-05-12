class CreateImportFiles < ActiveRecord::Migration
  def change
    create_table :import_files do |t|
      t.string :name
      t.datetime :imported_at
      t.string :filename

      t.timestamps
    end
  end
end
