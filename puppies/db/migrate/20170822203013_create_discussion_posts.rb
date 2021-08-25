class CreateDiscussionPosts < ActiveRecord::Migration[5.0]
  def change
    create_table :discussion_posts do |t|
      t.string :nickname, null: true
      t.text :body

      t.integer :parent_id, null: true, index: true
      t.integer :lft, :null => false, :index => true
      t.integer :rgt, :null => false, :index => true

      t.integer :depth, :null => false, :default => 0
      t.integer :children_count, :null => false, :default => 0

      t.timestamps
    end
  end
end
