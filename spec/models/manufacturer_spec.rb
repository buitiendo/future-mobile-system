require 'rails_helper'

RSpec.describe Manufacturer, type: :model do
  context "associations" do
    it{is_expected.to have_many :products}
  end

  context "column test" do
    it{is_expected.to have_db_column(:name).of_type :string}
  end

  context "validations" do
    it{is_expected.to validate_presence_of :name}
  end
end
