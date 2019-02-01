class User < ActiveRecord::Base
  has_many :articles

  # macro that gives each instance of a User access to password encryption methods via bcrypt
  has_secure_password

 #  def slug
 #   username.downcase.gsub(" ","-")
 #  end
 #
 # def self.find_by_slug(slug)
 #   User.all.find{|user| user.slug == slug}
 # end

end
