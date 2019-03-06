class UrlShortener < ApplicationRecord
    before_create :generate_new_short_url

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
  
    def get_title_url
      url = UrlShortener.find(self.id)
      url.title = "Test"
      url.save
    end
end
