# frozen_string_literal: true

module Types
  class AuthorType < Types::BaseObject
    field :id, ID, null: false
    field :first_name, String, null: false
    field :last_name, String, null: false
    field :year_of_birth, Integer, null: false
    field :alive, Boolean
    field :other_info, GraphQL::Types::JSON
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :full_name, String, null: false
    def full_name
      object.full_name
    end

    field :publication_dates, [GraphQL::Types::ISO8601Date], null: false
    def publication_years
      object.publication_years
    end

    field :nr_of_books, Integer, null: false
    def nr_of_books
      object.books.count
    end
    field :books, [Types::BookType], null: false, description: 'List of books from a author'
    def books
      object.books
    end
  end
end
