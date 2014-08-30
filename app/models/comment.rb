class Comment < ActiveRecord::Base
  belongs_to :article  # Each comment belongs to one article.
end
