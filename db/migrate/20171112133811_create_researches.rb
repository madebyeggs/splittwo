class CreateResearches < ActiveRecord::Migration
  def change
    create_table :researches do |t|

      t.timestamps null: false
    end
  end
end
