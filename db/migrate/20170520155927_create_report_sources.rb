class CreateReportSources < ActiveRecord::Migration[5.1]
  def change
    create_table :report_sources do |t|
      t.references :report, foreign_key: true
      t.string :url, null: false
      t.string :title, length: 255
      t.text :excerpt
      t.timestamps
    end
  end
end
