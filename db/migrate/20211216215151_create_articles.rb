class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :url
      t.string :headline
      t.references :newspaper, null: false, foreign_key: true

      t.timestamps
    end
  end
end
