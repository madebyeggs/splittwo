class AddAttachmentHeroToArtists < ActiveRecord::Migration
  def self.up
    change_table :artists do |t|
      t.attachment :hero
    end
  end

  def self.down
    remove_attachment :artists, :hero
  end
end
