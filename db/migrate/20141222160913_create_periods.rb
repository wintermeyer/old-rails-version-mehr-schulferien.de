class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.date :first_day
      t.date :last_day
      t.references :holiday, index: true
      t.references :periodable, polymorphic: true, index: true

      t.timestamps null: false
    end
    add_foreign_key :periods, :holidays
  end
end
