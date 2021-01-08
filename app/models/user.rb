class User < ApplicationRecord
    validates :name, 
            presence: true,
             uniqueness: { case_sensitive: false },
             length: {minimum:6, maximum:12}

    EMAIL_VALIDATE = /\A(\S+)@(.+)\.(\S+)\z/
    validates :email, 
            presence: true,
            uniqueness: { case_sensitive: false } ,
            length: {maximum: 100},
            format: {with: EMAIL_VALIDATE}
    has_many :articles
end