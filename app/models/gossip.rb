class Gossip < ApplicationRecord
    belongs_to :user 
    validates :content, length: { maximum: 250 }
end
