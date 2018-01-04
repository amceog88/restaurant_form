class AddFriendToFriendships < ActiveRecord::Migration[5.1]
  def change

     add_column :friendships ,:friend_id ,:integer, default: 0

  end
end
