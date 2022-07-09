class CreateLineItems < ActiveRecord::Migration[7.0]
  def change
    create_table :line_items do |t|
      t.references :dish, index: true
      t.belongs_to :cart, index: true


      t.timestamps
    end
  end
end
