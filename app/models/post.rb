class Post < ApplicationRecord
    has_many :comments    #esto no se genera automáticamente cuando hemos creado el scaffold. Lo añadimos después
    belongs_to :user

    mount_uploader :image, ImageUploader

    paginates_per 4

    def short_entry
        if blog_entry.length > 120
            blog_entry[0..120] 
        else
            blog_entry
        end
    end
end
