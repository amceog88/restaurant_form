class RenameFriendships < ActiveRecord::Migration[5.1]
  def change
    remove_column :friendships ,:frend_id 
  end
end
