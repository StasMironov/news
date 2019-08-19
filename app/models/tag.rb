class Tag < ApplicationRecord
    has_many :taggings
    has_many :microposts, through: :taggings

    def self.counts
       Tag.select("tags.*, count(taggings.id) as count").
         joins(:taggings).group("tags.id")
    end
end
