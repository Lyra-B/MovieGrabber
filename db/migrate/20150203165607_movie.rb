class Movie < ActiveRecord::Migration
  def up
  	create_table :movies do |t|
	    t.text :title
	    t.integer :year
    end
  end

  def down
  	drop_table :movies
  end
end
