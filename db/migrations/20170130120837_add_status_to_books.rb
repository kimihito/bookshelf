Hanami::Model.migration do
  change do
    alter_table :books do
      add_column :status, String, null: false, default: 'unread'
    end
  end
end
