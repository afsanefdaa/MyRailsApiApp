require 'rails_helper'

# Test suite for the Book model
RSpec.describe Book, type: :model do
  # Association test
  # ensure an item record belongs to a single shelf record
  it { should belong_to(:shelf) }
  # Validation test
  # ensure column name is present before saving
  it { should validate_presence_of(:title) }
end