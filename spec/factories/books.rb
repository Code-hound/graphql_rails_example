FactoryBot.define do
  factory :book do
    transient do
      nr_of_following { 0 }
    end
    association :author, strategy: :create, factory: :author
    title { Faker::Book.unique.title }

    after(:build) do |book, evaluator|
      book.publishment_date ||= Faker::Date.between(from: '01-01-1990', to: Date.current - 10.months)
    end

    after(:create) do |book, evaluator|
      if evaluator&.nr_of_following&.positive?
        create :book, author: book.author, publishment_date: Faker::Date.between(from: book.publishment_date, to: Date.current - 10.months), parent: book, nr_of_following: (evaluator.nr_of_following - 1) 
      end
    end
  end
end
