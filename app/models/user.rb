class User < ApplicationRecord
    validates :name, {presence: true,}
    validates :password, {presence: true,uniqueness: true}
    has_one_attached :avator
end
