class CreateTweets < ActiveRecord::Migration[6.0]
  def change
    create_table :tweets do |t|

      t.text :tweet
      t.integer :user_id
      t.timestamps
    end
  end
end
