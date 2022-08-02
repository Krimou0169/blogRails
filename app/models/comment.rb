class Comment < ApplicationRecord
  include Visible
  
  belongs_to :article #association with model article

  
    def avg_rating
      Comment.average(:review);
    end
  
end
