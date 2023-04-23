class RemoveForeignKeyConstraintFromPosts2 < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts, :user_id
  end
end
