class Order < ApplicationRecord
  belongs_to :user
  has_many :cocktails, class_name: "cocktail", foreign_key: "reference_id" :cocktail
end
