class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :slug
      t.string :address_line1
      t.string :address_line2
      t.string :street
      t.string :zip_code
      t.string :address_city_name
      t.string :email_address
      t.string :homepage_url
      t.references :city, index: true

      t.timestamps null: false
    end
    add_foreign_key :schools, :cities
  end
end
