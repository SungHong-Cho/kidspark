class User
  include Mongoid::Document
  field :name, type: String
  field :password, type: String

  validates_uniqueness_of :name
end
