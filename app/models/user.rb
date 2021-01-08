class User < ApplicationRecord
    validates :name, presence: true, length: {minimum:6, maximum:12}
    has_many :articles
end