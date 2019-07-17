Sequel.migration do
  change do
    alter_table(:users) do
      drop_index :user_name
      add_index :telegram_id, unique: true
    end
  end
end
