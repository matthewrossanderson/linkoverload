class CreateLinks < ActiveRecord::Migration
  def change
    create_table :links do |t|
      t.string :url
      t.string :submitter
      t.timestamp :submitted
      t.text :description

      t.timestamps
    end
  end
end
