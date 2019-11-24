require 'rails_helper'

RSpec.describe Article, type: :model do
  
  it "is valid with title, solution" do
    article = FactoryBot.build(:article)
    expect(article).to be_valid
  end

  it "is invalid with title" do
    article = FactoryBot.build(:article, title: nil)
    article.valid?
    expect(article.errors.messages[:title]).to include("can't be blank")
  end

  it "is invalid with  solution" do
    article = FactoryBot.build(:article, solution: nil)
    article.valid?
    expect(article.errors.messages[:solution]).to include("can't be blank")
  end

end
