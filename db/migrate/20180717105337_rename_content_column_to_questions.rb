class RenameContentColumnToQuestions < ActiveRecord::Migration[5.2]
  def change
    rename_column :questions, :content, :content_html
  end
end
