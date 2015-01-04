class CreatePhoneNumbers < ActiveRecord::Migration
  def change
    create_table :phone_numbers do |t|
      t.string :name
      t.string :value
      t.references :phone_numberable, polymorphic: true#, index: true

      t.timestamps null: false
    end
  end
end
