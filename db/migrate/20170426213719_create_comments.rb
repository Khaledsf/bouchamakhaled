class CreateComments < ActiveRecord::Migration
  
  def up
    create_table :comments do |t|
    	t.column "admin_user_id", :integer, :default => 0
    	t.column "article_id", :integer
    	t.column "user_id", :integer
    	t.column "content", :text

      t.timestamps null: false
    end
  end

  def down
  	drop_table :comments
  end

end