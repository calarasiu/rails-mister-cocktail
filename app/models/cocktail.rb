class Cocktail < ApplicationRecord
  has_many :doses, inverse_of: :cocktail, dependent: :destroy
  has_many :ingredients, through: :doses
  accepts_nested_attributes_for :doses, reject_if: :all_blank, allow_destroy: true
  has_one_attached :photo

  # validates :name, presence: true, uniqueness: true
  include PgSearch::Model
  pg_search_scope :search_by_name,
    against: [ :name ],
    using: {
      tsearch: { prefix: true } 
    }
end
