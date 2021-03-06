class User < ActiveRecord::Base
  has_secure_password
  has_many :trades

  def slug
    self.username.downcase.split(" ").join("-")
  end

  def self.find_by_slug(slug)
    self.all.find do |i|
      i.slug == slug
    end
  end
end
