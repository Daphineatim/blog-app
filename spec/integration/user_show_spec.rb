require 'rails_helper'

RSpec.describe 'Test Show user Page', type: :system do
  describe 'GET Show' do
    before(:each) do
      @user = User.create(name: 'Mohammed', photo: '#', bio: 'bio1', posts_counter: 0)
      @user.save!
      @first_post = Post.create(author: @user, title: 'My first post', text: 'post1 text',
                                comments_counter: 0, likes_counter: 0, id: 1)
      @second_post = Post.create(author: @user, title: 'My second post', text: 'post2 text',
                                 comments_counter: 0, likes_counter: 0, id: 2)
      @third_post = Post.create(author: @user, title: 'My third post', text: 'post3 text',
                                comments_counter: 0, likes_counter: 0, id: 3)
      @fourth_post = Post.create(author: @user, title: 'My last post',
                                 text: 'last post text', comments_counter: 0, likes_counter: 0, id: 4)
    
      visit(user_path(@user))
    end

    it 'shows the user username' do
      expect(page).to have_content('Mohammed')
    end

    it 'shows the user profile picture' do
      expect(page).to have_css('img')
    end

    it 'shows the user bio' do
      expect(page).to have_content('bio1')
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content('4')
    end

    it 'shows all the posts the user has written' do
      expect(page).to have_content('My last post')
      expect(page).to have_content('My third post')
      expect(page).to have_content('My second post')
    end
  end
end
