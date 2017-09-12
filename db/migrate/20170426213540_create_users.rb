class CreateUsers < ActiveRecord::Migration
  
  def up
    create_table :users do |t|
      t.column "username", :string, :limit => 25
      t.column "email", :string, :limit => 50
      t.column "password_digest", :string, :limit => 765

      t.timestamps null: false
    end
  end

  def down
  	drop_table :users
  end

end