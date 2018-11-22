require 'rails_helper'

RSpec.describe Comment, type: :model do
  let!(:category){FactoryBot.create :category}
  let!(:manufacturer){FactoryBot.create :manufacturer}
  let!(:account){FactoryBot.create :account}
  let!(:product){FactoryBot.create :product, manufacturer: manufacturer, category: category}
  let!(:comment){FactoryBot.create :comment, product: product, account: account}

  context "associations" do
    it{is_expected.to belong_to :account}
    it{is_expected.to belong_to :product}
  end

  context "column test" do
    it{is_expected.to have_db_column(:content).of_type :text}
  end

  context "validations" do
    it{is_expected.to validate_presence_of :content}
  end

  context "scope test" do
    it "scope select comment" do
      expect(Comment.select_comment).to eq [comment]
    end

    it "scope show comment desc" do
      expect(Comment.show_comment_desc).to eq [comment]
    end

    it "scope show comment desc" do
      expect(Comment.select_comment_product product.id).to eq [comment]
    end

    it "scope show comment desc" do
      expect(Comment.select_comment_product product.id).to be_truthy
    end
  end
end
