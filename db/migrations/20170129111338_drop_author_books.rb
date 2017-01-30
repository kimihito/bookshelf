Hanami::Model.migration do
  change do
    alter_table :books do
      drop_column :author
    end
  end
end
