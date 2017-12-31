class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :name, default: 'Anonymous User'
      t.text :content
      t.integer :post_id
      t.timestamps
    end
  end
end
