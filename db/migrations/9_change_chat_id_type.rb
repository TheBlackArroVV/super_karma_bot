Sequel.migration do
  change do
    drop_column :users, :chat_id
    add_column :users, :chat_id, String, index: true
  end
end
