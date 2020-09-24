class CreateBulkraxEntries < ActiveRecord::Migration[5.1]
  def change
    unless table_exists?(:bulkrax_entries)
      create_table :bulkrax_entries do |t|
        t.string :identifier
        t.string :collection_id
        t.string :type
        t.references :importer, null: false, foreign_key: {to_table: :bulkrax_importers}
        t.text :raw_metadata
        t.text :parsed_metadata

        t.timestamps
      end
    end
  end
end
