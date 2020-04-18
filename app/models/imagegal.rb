class Imagegal < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    paginates_per 12

    acts_as_taggable_on :tags
    has_many :tags
    validates :title, presence: true
    validates :caption, presence: true
    validates :tag_list, presence: true
    validates :image, presence: true
end