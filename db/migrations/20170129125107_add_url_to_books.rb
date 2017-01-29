Hanami::Model.migration do
  change do
    alter_table :books do
      add_column :url, String, null: false, unique: true
    end
  end
end
