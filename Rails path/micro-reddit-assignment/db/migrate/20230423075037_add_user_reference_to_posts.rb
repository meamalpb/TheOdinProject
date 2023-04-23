class AddUserReferenceToPosts < ActiveRecord::Migration[7.0]
  def change
    add_reference :posts, :user, foreign_key: { on_delete: :cascade }
  end
end
