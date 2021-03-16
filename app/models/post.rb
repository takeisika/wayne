class Post < ApplicationRecord
    validates :title,{presence:true,length:{maximum:50}}
    validates :content,{presence:true,length:{maximum:200}}
    has_many_attached :files
    has_many_attached :movies
end
