class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.integer :number
      t.text :main_content
      t.text :sec_content
      t.integer :extra_info

      t.timestamps null: false
    end
  end
end
