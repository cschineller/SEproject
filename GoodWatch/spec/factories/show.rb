FactoryBot.define do
    factory :book do
        title { "title" }
        studio  { "self" }
        number_of_seasons { 6 }
        year {2021}
        episodes {90}
    end
end