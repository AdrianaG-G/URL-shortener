class UrlShortener < ApplicationRecord
    before_create :generate_new_short_url
    validates :original_url, presence: true

    SHORTEST_LEMGTH = 8
    require 'securerandom'

    def generate_new_short_url
        #produces random alphanumeric strings
        new_url = SecureRandom.alphanumeric(SHORTEST_LEMGTH) 

        #Check short_url doesn't exist in the database.
        url_exist = UrlShortener.find_by_short_url(new_url)
        if url_exist.nil?
          self.short_url = new_url
        else
          #If short_url exists, we generate a new url.
          self.generate_new_short_url
        end    
    end
    
    def find_duplicate
        UrlShortener.find_by_original_url(self.original_url)
    end

    def url_not_saved?
      find_duplicate.nil?
    end
end
