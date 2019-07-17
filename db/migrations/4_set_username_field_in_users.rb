Sequel.migration do
  change do
    alter_table(:users) do
      rename_column :user_name, :username
    end
  end
end
