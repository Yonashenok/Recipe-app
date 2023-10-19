require 'rails_helper'

RSpec.describe Food, type: :model do
  let(:user) { User.create(email: 'example@gmail.com', name: 'foo', password: 'passsword') }

  it 'should have valid attribute' do
    food = Food.new(name: 'Apple', measurement_unit: 'gram', price: 10, quantity: 30, user:)
    expect(food).to be_valid
  end

  it 'should have invalid attribute with missing values' do
    food = Food.new(name: nil, measurement_unit: nil, price: nil, quantity: nil, user:)
    expect(food).not_to be_valid
  end
end
