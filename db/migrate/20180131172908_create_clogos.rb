class CreateClogos < ActiveRecord::Migration
  def change
    create_table :clogos do |t|
      t.timestamps null: false
    end
  end
end
