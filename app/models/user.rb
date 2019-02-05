class User < ActiveRecord::Base
  has_many :articles

  # macro that gives each instance of a User access to password encryption methods via bcrypt
  has_secure_password

  # username and email must be present on a User instance before it can be saved
  validates :username, presence: true
  validates :email, presence: true
  # add validation for proper email structure

  # def already_a_user?
  #   User.find_by(username: self.username)
  #   self.errors.add(:email, "already registered to an existing user.") if flag
  #   flag
  # end

 #  def slug
 #   username.downcase.gsub(" ","-")
 #  end
 #
 # def self.find_by_slug(slug)
 #   User.all.find{|user| user.slug == slug}
 # end

end
