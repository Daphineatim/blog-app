require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'Post without name' do
    post = Post.create(author_id: 1, text: 'Hello1')
    expect(post).to_not be_valid
  end

  it 'Post with comment counter negative' do
    post = Post.create(author_id: 1, text: 'Hello1')
    post.comments_counter = -1
    expect(post).to_not be_valid
  end

  it 'Post with comment counter decimal' do
    post = Post.create(author_id: 1, text: 'Hello1')
    post.comments_counter = 2.2
    expect(post).to_not be_valid
  end

  it 'Post with likes counter decimal' do
    post = Post.create(author_id: 1, text: 'Hello1')
    post.likes_counter = 2.2
    expect(post).to_not be_valid
  end

  it 'Post with likes counter decimal' do
    post = Post.create(author_id: 1, text: 'Hello1')
    post.likes_counter = 2.2
    expect(post).to_not be_valid
  end

  it 'Post with title length >250 characters' do
    post = Post.create(author_id: 1, title: 'one', text: 'Hello1')
    post.title = (0...255).map { 'a' }.join
    expect(post).to_not be_valid
  end

  it 'Update post counter' do
    user = User.create(name: 'John', photo: 'www.google.com', bio: 'Male', posts_counter: 0)
    post = Post.create(author_id: user.id, title: 'ello', text: 'Hello1', comments_counter:0, likes_counter: 0)
    user2 = User.first

    expect(user2.posts_counter).to eq(1)
  end

  it 'last 5 comm' do
    user = User.create(name: 'John', photo: 'www.google.com', bio: 'Male', posts_counter: 0)
    post = Post.create(author_id: user.id, title: 'ello', text: 'Hello1', comments_counter:0, likes_counter: 0)
    Comment.create(text: 'Mata', author_id: user.id, post_id: post.id)
    Comment.create(text: 'Mata', author_id: user.id, post_id: post.id)
    Comment.create(text: 'Mata', author_id: user.id, post_id: post.id)
    Comment.create(text: 'Mata', author_id: user.id, post_id: post.id)
    Comment.create(text: 'Mata', author_id: user.id, post_id: post.id)
    Comment.create(text: 'Mata', author_id: user.id, post_id: post.id)

    expect(post.last_5_comments.length).to eq(5)
  end
end
