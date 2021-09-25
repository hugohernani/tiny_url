class CreateVisitors < ActiveRecord::Migration[6.1]
  def change
    create_table :visitors do |t|
      t.string :request_ip
      t.integer :visits, default: 0

      t.references :link, null: false, foreign_key: true

      t.timestamps
    end
  end
end
