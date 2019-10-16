class AddAttachmentHeroToReleases < ActiveRecord::Migration
  def self.up
    change_table :releases do |t|
      t.attachment :hero
    end
  end

  def self.down
    remove_attachment :releases, :hero
  end
end
