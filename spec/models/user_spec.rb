require 'rails_helper'

describe 'validations' do
  it { should validate_presence_of(:user) }
end

RSpec.describe User, type: :model do
  it 'Testing user without name' do
    user = User.create
    expect(user).to_not be_valid
  end

  it 'Testing user PostCounter number negative' do
    user = User.create(name: 'John', photo: 'www.google.com', bio: 'Male', posts_counter: -1)
    expect(user).to_not be_valid
  end

  it 'Testing user PostCounter decimal number' do
    user = User.create(name: 'John', photo: 'www.google.com', bio: 'Male', posts_counter: 10.1)
    expect(user).to_not be_valid
  end

  it 'User last 3 posts' do
    user = User.create(name: 'John', photo: 'www.google.com', bio: 'Male', posts_counter: 0)
    Post.create(author: user, title: 'Title1', text: 'Hello1', comments_counter: 0, likes_counter: 0)
    Post.create(author: user, title: 'Title1', text: 'Hello2', comments_counter: 0, likes_counter: 0)
    Post.create(author: user, title: 'Title1', text: 'Hello3', comments_counter: 0, likes_counter: 0)
    Post.create(author: user, title: 'Title1', text: 'Hello4', comments_counter: 0, likes_counter: 0)
    expect(user.last_3_posts.length).to eq(3)
  end
end
