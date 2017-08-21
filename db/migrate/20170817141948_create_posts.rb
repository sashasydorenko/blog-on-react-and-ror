class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.string :file
      t.text :content
      t.references :category, foreign_key: true
      t.integer :comments_count, default: 0

      t.timestamps
    end
  end
end
