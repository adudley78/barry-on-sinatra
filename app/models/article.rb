class Article < ActiveRecord::Base
  belongs_to :user

  def self.search(search)
    where("title like ?", "%#{search}%")
  end
end
