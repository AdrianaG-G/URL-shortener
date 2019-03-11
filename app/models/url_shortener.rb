# frozen_string_literal: true

class UrlShortener < ApplicationRecord
  validates :original_url, presence: true

  # Generates short_url for id specified using Base62 encoding
  def generate_short_url(url_id)
    # Base62 alphabet to be used
    alphabet_array = [*'a'..'z', *'A'..'Z', *'0'..'9']
    shorturl = []
    while url_id.to_i.positive?
      shorturl.push(alphabet_array[url_id % 62])
      url_id /= 62
    end
    new_url = shorturl.reverse.join

    # Check short_url doesn't exist in the database. If short_url exists, we generate a new url
    url_exist = UrlShortener.find_by_short_url(new_url)
    return new_url if url_exist.blank?

    generate_short_url(url_id)
  end

  def find_duplicate
    UrlShortener.find_by_original_url(original_url)
  end

  def url_not_saved?
    find_duplicate.blank?
  end
end
