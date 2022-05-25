require 'rails_helper'

RSpec.describe 'Group model', type: :model do
  subject do
    User.create!(name: 'Frank', email: 'frankly@gmail.com', confirmed_at: Time.now, password: 'password')
  end

  before(:each) { subject.save }

  it 'Total amount for Transaction' do
    group1 = Group.create!(name: 'Foody', icon: 'food.png', user_id: subject.id)
    category1 = Category.create!(name: 'Food stuff', amount: 50, user_id: subject.id)
    category2 = Category.create!(name: 'Food stuff', amount: 45, user_id: subject.id)
    CategoryGroup.create!(category_id: category1.id, group_id: group1.id)
    CategoryGroup.create!(category_id: category2.id, group_id: group1.id)

    value = Group.total_spending(group1.id)

    expect(value).to eq(95)
  end
end
