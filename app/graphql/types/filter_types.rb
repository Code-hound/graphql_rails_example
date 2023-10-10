module Types
  class SearchInputType < GraphQL::Schema::InputObject
    argument :key, String, required: true
    argument :value, String, required: true
  end

  class FilterInputType < GraphQL::Schema::InputObject
    argument :key, String, required: true
    argument :value, String, required: true
  end

  class SortInputType < GraphQL::Schema::InputObject
    argument :key, String, required: true
    argument :order, String, required: true
  end
end