Sequel.migration do
  change do
    add_column :users, :chat_id, Integer, index: true
  end
end
