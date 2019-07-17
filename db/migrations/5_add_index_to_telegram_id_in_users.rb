Sequel.migration do
  change do
    alter_table(:users) do
      add_index :telegram_id, unique: true
    end
  end
end
