class CreateFriendrequests < ActiveRecord::Migration[5.2]
  def change
    create_table :friendrequests do |t|
      t.string :status    
      t.references :sender, foreign_key: { to_table: :users }
      t.references :receiver, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
