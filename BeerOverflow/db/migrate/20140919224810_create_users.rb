class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username # should not be NULL-able null: false, default: "mister sassypants"
      t.string :password_hash #**Really** should not be NULL-able
      t.string :password_salt
      t.timestamps
    end
  end
end
