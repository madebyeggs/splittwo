class AddNewsletterToPlacements < ActiveRecord::Migration
  def change
    add_column :works, :newsletter, :boolean
  end
end
