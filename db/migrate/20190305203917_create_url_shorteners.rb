# frozen_string_literal: true

class CreateUrlShorteners < ActiveRecord::Migration[5.2]
  def change
    create_table :url_shorteners do |t|
      t.string :short_url
      t.text :original_url

      t.timestamps
    end
  end
end
