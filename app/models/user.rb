class User < ActiveRecord::Base
  has_many :articles

  # macro that gives each instance of a User access to password encryption methods via bcrypt
  has_secure_password

  # unique username and email must be present on a User instance before it can be saved
  validates :username, uniqueness: true
  validates :email, uniqueness: true

  # create unique_user? method with error messages to call on registration
  # create username_suggester method with unique username suggestions to call on registration

end
