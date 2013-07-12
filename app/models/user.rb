class User
  include Mongoid::Document
  field :id, type: String
  field :password_digest, type: String
<<<<<<< HEAD

  has_secure_password
  validates_uniqueness_of :id
=======
  
  has_secure_password
>>>>>>> 6145b7bc951040432779e85f46fc9297e681713c
end
