class CreateShrinkUrl < ActiveRecord::Migration
  def change
    create_table :shrink_urls do |t|
      t.string :orginal_url
      t.string :short_url
    end
  end
end
