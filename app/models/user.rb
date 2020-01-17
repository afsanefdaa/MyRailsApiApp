class User < ApplicationRecord
  # encrypt password
  #  this adds methods to authenticate against a bcrypt password. It's this mechanism that requires us to have a password_digest attribute. Thus, we need to have the bcrypt gem as a dependency
  has_secure_password

  # Model associations
  has_many :shelves, foreign_key: :created_by
  # Validations
  validates_presence_of :name, :email, :password_digest
end
