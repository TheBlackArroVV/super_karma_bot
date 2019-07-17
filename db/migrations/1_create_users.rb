Sequel.migration do
  change do
    create_table? :users do
      primary_key :id
      String :user_name
      Integer :count
    end
  end
end
