Sequel.migration do
  change do
    add_column :users, :first_name, String
    add_column :users, :last_name, String
    add_column :users, :telegram_id, Integer
  end
end
