# frozen_string_literal: true

class AddTitleToUrlShorteners < ActiveRecord::Migration[5.2]
  def change
    add_column :url_shorteners, :title, :string
  end
end
