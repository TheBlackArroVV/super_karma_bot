Sequel.migration do
  change do
    alter_table(:users) do
      add_index :user_name, unique: true
    end
  end
end
