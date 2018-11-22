require 'rails_helper'

RSpec.describe Product, type: :model do
  context "associations" do
    it{is_expected.to belong_to :category}
    it{is_expected.to belong_to :manufacturer}
  end

  context "column test" do
    it{is_expected.to have_db_column(:name).of_type :string}
    it{is_expected.to have_db_column(:quantity).of_type :integer}
    it{is_expected.to have_db_column(:price).of_type :decimal}
    it{is_expected.to have_db_column(:description).of_type :text}
    it{is_expected.to have_db_column(:hot).of_type :integer}
  end

  context "validations" do
    it{is_expected.to validate_presence_of :name}
    it{is_expected.to validate_length_of(:name)
      .is_at_most Settings.size.length_name}
    it{is_expected.to validate_presence_of :quantity}
    it{is_expected.to validate_presence_of :price}
    it{is_expected.to validate_presence_of :description}
    it{is_expected.to validate_presence_of :hot}
    it{is_expected.to validate_length_of(:description)
      .is_at_most Settings.size.length_name_description}
  end
end
