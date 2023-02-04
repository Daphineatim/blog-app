require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'Update comment counter for post' do
    user = User.create(name: 'John', photo: 'www.google.com', bio: 'Male', posts_counter: 0)
    post = Post.create(author_id: user.id, title: 'ello', text: 'Hello1', comments_counter: 0, likes_counter: 0)
    Comment.create(text: 'Mata', author_id: user.id, post_id: post.id)
    postfirst = Post.first

    expect(postfirst.comments_counter).to eq(1)
  end
end
