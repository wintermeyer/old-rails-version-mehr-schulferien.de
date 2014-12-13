class CreateFederalStates < ActiveRecord::Migration
  def change
    create_table :federal_states do |t|
      t.integer :country_id
      t.string :name
      t.string :slug

      t.timestamps null: false
    end
    add_index :federal_states, :slug, unique: true
  end
end
