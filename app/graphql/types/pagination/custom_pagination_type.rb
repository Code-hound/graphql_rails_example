module Types
  module Pagination
    class CustomPaginationType < GraphQL::Schema::Object
      field :current_page, Integer, null: false, description: "Current Page of loaded data"
      field :per_page, Integer, null: false, description: "The number of items per page"
      field :total_count, Integer, null: false, description: "The total number of items to be paginated"
      field :total_pages, Integer, null: false, description: "The total number of pages in the pagination"

      def total_count
        object.count
      end
    end
  end
end