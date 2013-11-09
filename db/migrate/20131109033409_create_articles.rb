class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.string :source
      t.hstore :data

      t.timestamps
    end
  end
end
