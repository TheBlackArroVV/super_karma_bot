Sequel.migration do
  change do
    drop_index :users, :user_name
    drop_index :users, :telegram_id
    add_index :users, :telegram_id
  end
end
