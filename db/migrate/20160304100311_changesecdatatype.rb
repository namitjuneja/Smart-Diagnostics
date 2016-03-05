class Changesecdatatype < ActiveRecord::Migration
  def change
  	  	change_column :contents, :sec_content, :text;
  end
end
