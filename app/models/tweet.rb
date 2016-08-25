class Tweet < ApplicationRecord
    validates :body, presence: true,
                     length: { minimum: 3, maximum: 140 }
    validates :user_id, presence: true

    belongs_to :user
end
