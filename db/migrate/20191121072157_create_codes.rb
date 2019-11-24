class CreateCodes < ActiveRecord::Migration[5.2]
  def change
    create_table :codes do |t|
      t.text          :code
      t.references    :article, foreign_key: true
      t.timestamps
    end
  end
end
