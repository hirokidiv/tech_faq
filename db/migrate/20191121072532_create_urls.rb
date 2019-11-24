class CreateUrls < ActiveRecord::Migration[5.2]
  def change
    create_table :urls do |t|
      t.text          :link
      t.references    :article, foreign_key: true
      t.timestamps
    end
  end
end
