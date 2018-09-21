class CreateCompositonlogos < ActiveRecord::Migration
  def change
    create_table :compositonlogos do |t|
      t.timestamps null: false
    end
  end
end
