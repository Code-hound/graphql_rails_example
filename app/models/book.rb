class Book < ApplicationRecord
  acts_as_nested_set counter_cache: :children_count
  belongs_to :author
end

