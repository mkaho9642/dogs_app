class CreatePostComments < ActiveRecord::Migration[6.1]
  def change
    create_table :post_comments do |t|
      t.text :comment_text
      t.integer :user_id
      t.integer :review_id
      t.timestamps
    end
  end
end
