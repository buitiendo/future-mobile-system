require 'rails_helper'

RSpec.describe Category, type: :model do
  let!(:category){ FactoryBot.create :category}

  context "associations" do
    it{is_expected.to have_many :products}
  end

  context "columns" do
    it{is_expected.to have_db_column(:name).of_type :string}
    it{is_expected.to have_db_column(:parent_id).of_type :integer}
  end

  context "validations" do
    it{is_expected.to validate_presence_of :name}
    it{is_expected.to validate_length_of(:name).is_at_most Settings.size.length_name_category}
  end

  context "scope test category" do
    it "scope select category" do
      expect(Category.select_category).to eq [category]
    end

    it "scope select category" do
      expect(Category.create_desc).to eq [category]
    end

    it "scope select category" do
      expect(Category.select_categories_parent category.parent_id).to eq [category]
    end

    it "scope select category" do
      expect(Category.select_desc_parent).to eq [category]
    end
  end
end
