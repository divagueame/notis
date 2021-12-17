class AddNewspaperRelativeCheckbox < ActiveRecord::Migration[6.1]
  def change
    add_column :newspapers, :newspaperUrlRelative, :boolean, default: true
  end
end
