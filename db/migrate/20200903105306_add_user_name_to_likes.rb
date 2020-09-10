class AddUserNameToLikes < ActiveRecord::Migration[5.0]
  def change
    add_column :likes, :user_name, :string
  end
end
