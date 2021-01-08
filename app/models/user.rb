class User < ApplicationRecord
    validates :name, presence: true, length: {minimum:6, maximum:12}
end