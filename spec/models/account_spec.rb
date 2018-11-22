require 'rails_helper'

RSpec.describe Account, type: :model do
  context "associations" do
    it{is_expected.to have_many :orders}
    it{is_expected.to have_many :comments}
  end

  context "columns" do
    it{is_expected.to have_db_column(:fullname).of_type :string}
    it{is_expected.to have_db_column(:email).of_type :string}
    it{is_expected.to have_db_column(:phone).of_type :string}
    it{is_expected.to have_db_column(:address).of_type :string}
  end

  context "validations" do
    it{is_expected.to validate_presence_of :fullname}
    it{is_expected.to validate_length_of(:fullname)
      .is_at_most Settings.size.max_fullname}
  end
end
