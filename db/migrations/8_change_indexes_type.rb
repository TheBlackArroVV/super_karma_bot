Sequel.migration do
  change do
    add_index :users, :chat_id
  end
end
