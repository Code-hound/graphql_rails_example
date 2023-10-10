module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    field :test_field, String, null: false,
      description: "An example field added by the generator"
    def test_field
      "Hello World!"
    end

    field :authors, Types::AuthorType.collection_type(metadata_type: Types::Pagination::CustomPaginationType), null: false do
      argument :per_page, Integer, required: false
      argument :current_page, Integer, required: false
    end

    def authors(per_page: 10, current_page: 1)
      ::Author.paginate(page: current_page, per_page: per_page)
    end
    
    field :author, Types::AuthorType,
    description: 'Representation of an Author' do
      argument :id, ID, required: true
    end

    def author(id:)
      Author.find_by(id: id)
    end

    field :books, [Types::BookType], description: 'List of books'
    def books
      Book.all
    end
    field :book, Types::BookType,
    description: 'Representation of an Book' do
      argument :id, ID, required: true
    end

    def book(id:)
      Book.find_by(id: id)
    end
  end
end
