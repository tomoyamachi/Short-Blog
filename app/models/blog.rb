require 'digest'
class Blog < ActiveRecord::Base
  has_many :articles
  attr_accessor :password
  attr_accessible :password_confirmation
  validates :password,
  :presence => true,
  :confirmation => true
  validates :mail, :presence => true
  validates :title, :presence => true
  before_save :encrypt_password

  def has_password?(submitted_passwd)
    encrypted_password == encrypt(submitted_passwd)
  end

  def self.authenticate(mail, submitted_password)
    blog = find_by_mail(mail)
    return false  if blog.nil?
    return blog if blog.has_password?(submitted_password)
  end

  private
  def encrypt_password
    self.encrypted_password = encrypt(self.password)
  end

  def encrypt(str)
    Digest::SHA2.hexdigest(str)
  end
end
