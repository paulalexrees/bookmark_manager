require 'data_mapper'
require 'dm-postgres-adapter'

class User
  include DataMapper::Resource

  # @user_count = 0

  property :id, Serial
  property :username, String
  property :email, String
  property :password, String

  has n, :links, :through => Resource

  # def initialize
  #   @user_count += 1
  # end
  #
  # def self.user_count
  #   @user_count
  # end

end
