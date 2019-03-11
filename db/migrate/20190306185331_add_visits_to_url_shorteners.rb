# frozen_string_literal: true

class AddVisitsToUrlShorteners < ActiveRecord::Migration[5.2]
  def change
    add_column :url_shorteners, :visits, :integer, default: 0
  end
end
