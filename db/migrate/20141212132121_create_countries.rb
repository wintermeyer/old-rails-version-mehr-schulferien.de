class CreateCountries < ActiveRecord::Migration
  def change
    create_table :countries do |t|
      t.string :name
      t.string :slug
      t.string :url_prefix

      t.timestamps null: false
    end
    add_index :countries, :slug, unique: true
    add_index :countries, :url_prefix, unique: true
  end
end
