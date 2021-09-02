class DiscussionPost < ActiveRecord::Base
  acts_as_nested_set

  validates :body, presence: true
end
