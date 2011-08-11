class Article < ActiveRecord::Base
  belongs_to :blog
  has_and_belongs_to_many :categories
  validates :title, :presence => true, :length => { :maximum => 50 }
  validates :description, :presence => true
end
