class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :receiver
      t.string :title
      t.text :content
      t.integer :category_id

      t.timestamps
    end
  end
end
