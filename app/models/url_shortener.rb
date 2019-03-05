class UrlShortener < ApplicationRecord
    before_create :generate_new_short_url
    require 'securerandom'

    def generate_new_short_url
        #produces random alphanumeric strings
        new_url = SecureRandom.alphanumeric(6) 

        #Check short_url doesn't exist in the database.
        #If short_url exists, we generate a new url.
        url_exist = UrlShortener.find_by_short_url(new_url)
        if url_exist.nil?
            self.short_url = url_exist
        else
            self.generate_new_short_url
        end    
    end
    
end
