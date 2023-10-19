require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(email: 'example@gmail.com', name: 'foo', password: 'passsword') }
  it 'should have valid attribute' do
    expect(user).to be_valid
  end
  it 'should have invalid attribute with missing values' do
    user.email = nil
    user.name = nil
    user.password = nil
    expect(user).not_to be_valid
  end
end
