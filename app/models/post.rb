class Post < ApplicationRecord
    has_many :comments    #esto no se genera automáticamente cuando hemos creado el scaffold. Lo añadimos después

    belongs_to :user

    paginates_per 2
end
