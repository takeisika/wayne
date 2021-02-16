class Task < ApplicationRecord
    validates :status,{presence:true,length:{maximum:50}}
    validates :content,{presence:true,length:{maximum:200}}
end
