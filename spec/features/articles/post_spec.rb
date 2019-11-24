require 'rails_helper'

RSpec.feature "Articles::Posts", type: :feature do
  scenario "user create post" do
    user = FactoryBot.create(:user)
    visit root_path
    click_link "ログイン"
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Log in" 


    expect {
      click_link "新規投稿"
      fill_in "Title", with: "test"
      fill_in "Tag list", with: "rails, ruby"
      fill_in "Solution", with: "test"
      fill_in "Factor", with: "test"
      fill_in "Knowledge", with: "test"
      click_button "送信する" 
      
      expect(page).to have_content "test"
      expect(page).to have_content "rails"
      expect(page).to have_content "ruby"
  }.to change(user.articles, :count).by(1)
  end
end
