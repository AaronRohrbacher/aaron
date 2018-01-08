class CreateViews < ActiveRecord::Migration[5.1]
  def change
    create_table :views do |t|
      t.integer :post_id
      t.string :city
      t.string :ip_address

      t.timestamps
    end
  end
end
