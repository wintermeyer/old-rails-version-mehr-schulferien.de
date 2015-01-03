class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :slug
      t.string :zip_code
      t.references :federal_state, index: true

      t.timestamps null: false
    end
    add_foreign_key :cities, :federal_states
  end
end
