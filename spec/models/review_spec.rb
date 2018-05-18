require 'rails_helper'

RSpec.describe Review, type: :model do
  it{should respond_to(:book)}
  it{should respond_to(:user)}
end
