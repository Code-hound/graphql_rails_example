class Author < ApplicationRecord
  has_many :books, dependent: :restrict_with_error

  def full_name
    "#{first_name} #{last_name}"
  end

  def publication_dates
    books.map(&:publishment_date).sort || []
  end

  def to_s
    full_name
  end
end
