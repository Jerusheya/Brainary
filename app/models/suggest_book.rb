class SuggestBook < ApplicationRecord
    validates :user_name, format: { without: /\s/, message: "name must contain no spaces" }
end
