class AddPasswordToBlog < ActiveRecord::Migration
  def self.up
    add_column :blogs, :encrypted_password, :string
    add_column :blogs, :mail, :string
  end

  def self.down
    remove_column :blogs, :encrypted_password, :string
    remove_column :blogs, :mail, :string
  end
end
