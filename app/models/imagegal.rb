class Imagegal < ApplicationRecord
    has_many_attached :images
    belongs_to :user
    paginates_per 8

    acts_as_taggable_on :tags
    has_many :tags
    validates :title, presence: true
    validates :caption, presence: true
    validates :tag_list, presence: true
    validates :images, presence: true
    
end