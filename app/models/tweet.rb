class Tweet < ApplicationRecord
    validates :body, presence: true,
                     length: { minimum: 3, maximum: 140 }

    belongs_to :user
end
