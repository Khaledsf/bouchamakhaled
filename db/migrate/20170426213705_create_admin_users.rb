class CreateAdminUsers < ActiveRecord::Migration
  
  def up
    create_table :admin_users do |t|
    	t.column "admin_name", :string, :limit => 25, :default => "administrator"
      t.column "email", :string, :limit => 50
      t.column "password_digest", :string

      t.timestamps null: false
    end
  end

  def down
  	drop_table :admin_users
  end

end
