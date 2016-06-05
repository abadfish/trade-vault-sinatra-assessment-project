class User < ActiveRecord::Base
  has_many :trades
end
