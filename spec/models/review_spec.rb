require 'rails_helper'

RSpec.describe Review, type: :model do
  it{should validate_presence_of(:score)}
  it{should validate_presence_of(:text)}
  it{should belong_to(:book)}
  it{should belong_to(:user)}
end
