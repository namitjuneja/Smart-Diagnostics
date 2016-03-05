class Changecontentdatatype < ActiveRecord::Migration
  def change
  	change_column :contents, :main_content, :text;
  end
end
