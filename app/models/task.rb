class Task < ApplicationRecord
    validates :phrase,{presence:true,length:{maximum:50}}
    validates :content,{presence:true,length:{maximum:200}}
end
