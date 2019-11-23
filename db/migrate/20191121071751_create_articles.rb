class CreateArticles < ActiveRecord::Migration[5.2]
  def change
    create_table :articles do |t|
      t.text        :title, null: false
      t.text        :solution, null: false
      t.text        :factor, null:false
      t.text        :knowledge, null: false
      t.references  :user, null: false
      t.timestamps
    end
  end
end