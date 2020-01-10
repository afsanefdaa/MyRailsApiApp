require 'rails_helper'

# Test suite for the Shelf model
RSpec.describe Shelf, type: :model do
  # Association test
  # ensure Shelf model has a 1:m relationship with the Item model
  it { should have_many(:books).dependent(:destroy) }
  # Validation tests
  # ensure columns title and created_by are present before saving
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:created_by) }
end