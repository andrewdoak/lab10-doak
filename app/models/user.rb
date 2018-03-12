class User < ApplicationRecord
  #Ensure there is at least one admin user
  after_destroy :ensure_an_admin_remains
  validates :name, presence: true, uniqueness: true
  has_secure_password
  
  class Error < StandardError
  end
  
  #Don't allow last user to be deleted!
  private
  def ensure_an_admin_remains
    if User.count.zero?
      raise Error.new "Can't delete last user"
    end
  end
end
