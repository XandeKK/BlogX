class CreateArticles < ActiveRecord::Migration[7.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :description
      t.string :content
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
