class CreateNewspapers < ActiveRecord::Migration[6.1]
  def change
    create_table :newspapers do |t|
      t.string :newspaperName
      t.string :newspaperUrl
      t.string :newspaperCssSelector

      t.timestamps
    end
  end
end
