# frozen_string_literal: true

module Types
  class BookType < Types::BaseObject
    field :id, ID, null: false
    field :author_id, Integer, null: false
    field :title, String
    field :publishment_date, GraphQL::Types::ISO8601Date
    field :parent_id, Integer
    field :lft, Integer, null: false
    field :rgt, Integer, null: false
    field :depth, Integer, null: false
    field :children_count, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false

    field :author, Types::AuthorType, null: false

    def author
      object.author
    end

    field :previous_book, Types::BookType, null: true
    def previous_book
      object.parent
    end
  end
end