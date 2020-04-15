class Imagegal < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    paginates_per 4
end