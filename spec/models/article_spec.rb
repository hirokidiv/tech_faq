require 'rails_helper'

RSpec.describe Article, type: :model do
  let(:user) { FactoryBot.create(:user) }

  it "is valid with title, solution" do
    article = FactoryBot.build(:article, user_id: user.id)
    expect(article).to be_valid
  end

  it "is invalid with title" do
    article = FactoryBot.build(:article, title: nil, user_id: user.id)
    article.valid?
    expect(article.errors.messages[:title]).to include("can't be blank")
  end

  it "is invalid with  solution" do
    article = FactoryBot.build(:article, solution: nil, user_id: user.id)
    article.valid?
    expect(article.errors.messages[:solution]).to include("can't be blank")
  end

  it "is invalid with tags_list" do
    article = FactoryBot.build(:article, tag_list: "rails", user_id: user.id)
    article.valid?
    expect(article).to be_valid
  end

end
