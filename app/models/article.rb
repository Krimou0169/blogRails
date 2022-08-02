class Article < ApplicationRecord
    include Visible

    has_many :comments, dependent: :destroy #association with comment

    validates :title, presence: true
    validates :body, presence: true

    #method calculating the average rating
    def avg_review
        unless self.review.empty? #except for review empty
          comments.average(:review).round() #make rounded average
        else
          0.0 #else desplay 0
        end
      end

end
  