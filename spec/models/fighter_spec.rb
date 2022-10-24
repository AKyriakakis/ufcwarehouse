require 'rails_helper'

RSpec.describe Fighter, type: :model do
  before do
    @fighter = create(:fighter)
  end

  it 'is valid with valid attributes' do
    expect(@fighter).to be_valid
  end

  it 'is invalid with missing age' do
    @fighter.name = nil
    expect(@fighter).not_to be_valid
  end
end
