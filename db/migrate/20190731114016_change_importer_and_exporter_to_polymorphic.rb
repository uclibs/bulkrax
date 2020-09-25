module Bulkrax
  class Entry < ApplicationRecord
     belongs_to :importer
  end
end

class ChangeImporterAndExporterToPolymorphic < ActiveRecord::Migration[5.1]
  def change
    # ActiveRecord::Base.connection.execute "ALTER TABLE `bulkrax_entries` CHANGE `importer_id` `importerexporter_id` bigint(20)"
    add_column :bulkrax_entries, :importerexporter_type, :string, after: :id, default: 'Bulkrax::Importer' unless column_exists?(:bulkrax_entries, :importerexporter_type)
  end
end
