class AddTitleToSuggestions < ActiveRecord::Migration
  def change
    add_column :suggestions, :title, :string, :limit => Suggestion::TITLE_LEN
  end
end
