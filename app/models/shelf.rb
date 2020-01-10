class Shelf < ApplicationRecord
  # model association
  has_many :books, dependent: :destroy

  # validations
  validates_presence_of :title, :created_by
end
