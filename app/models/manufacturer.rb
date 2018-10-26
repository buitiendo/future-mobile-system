class Manufacturer < ApplicationRecord
  has_many :products, dependent: :destroy
  validates :name, presence: true, length: {maximum: Settings.size.length_name}
  scope :select_manufacturer, -> {select :id, :name}
end
