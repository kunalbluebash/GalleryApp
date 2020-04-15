class Imagegal < ApplicationRecord
    has_many_attached :images
    belongs_to :user
    paginates_per 4

    
end