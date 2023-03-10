require 'rails_helper'

RSpec.describe 'Test Index Page', type: :system do
  describe 'GET index' do
    before(:each) do
      @first_user = User.create(name: 'Mohammed', photo: '#', bio: 'bio1', posts_counter: 1)
      @first_user.save!
      @second_user = User.create(name: 'Ahmed', photo: '#', bio: 'bio2', posts_counter: 3)
      @second_user.save!
      @third_user = User.create(name: 'Marwan', photo: '#', bio: 'bio3', posts_counter: 5)
      @third_user.save!
    end

    it 'shows the users username' do
      visit users_path
      expect(page).to have_content('Mohammed')
      expect(page).to have_content('Ahmed')
      expect(page).to have_content('Marwan')
    end

    it 'shows the users profile picture' do
      visit users_path
      expect(page).to have_css('img')
    end

    it 'shows the number of posts of each user' do
      visit users_path
      expect(page).to have_content('1')
      expect(page).to have_content('3')
      expect(page).to have_content('5')
    end
  end
end
