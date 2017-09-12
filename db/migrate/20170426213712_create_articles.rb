class CreateArticles < ActiveRecord::Migration
  
  def up
    create_table :articles do |t|
    	t.column "admin_user_id", :integer
    	t.column "title", :text
      t.column "intro", :text
      t.column "bodytag", :text
      t.column "body", :text

      t.timestamps null: false
    end
  end

  def down
  	drop_table :articles
  end

end
