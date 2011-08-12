class AddArticleNumToCategory < ActiveRecord::Migration
  def self.up
    add_column :categories, :article_num, :integer, :default => 0 
  end

  def self.down
    remove_column :categories, :article_num 
  end
end
